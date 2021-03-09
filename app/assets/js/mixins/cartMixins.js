let cartMixins = {
  data() {
    return {
      cartsList: [],
      productsList: [],
      cartNum: 0,
      memberPoints: 0,
      selectedSeriesList: ['BS', 'EN', 'TA', 'EM', 'PM', 'PA', 'RV', 'CA'],
      seriesList: [{
        eName: "EN",
        name: "工程系",
      }, {
        eName: "RV",
        name: "RV休旅系",
      }, {
        eName: "TA",
        name: "計程車系",
      }, {
        eName: "BS",
        name: "巴士系",
      }, {
        eName: "PA",
        name: "警車系",
      }, {
        eName: "EM",
        name: "消防救護系",
      }, {
        eName: "CA",
        name: "轎車系",
      }, {
        eName: "PM",
        name: "PREMIUM系",
      }],
    }

  },

  methods: {
    addCarts(val) {




      this.cartsList.push(val);
      let cartJson = JSON.stringify(this.cartsList);
      localStorage.setItem('cartsList', cartJson);



      //   const runcart = new TimelineMax({});
      //   runcart.to('.box', .3, {
      //     x: 500,
      //     opacity: 0,
      //     ease: Linear.easeNone,

      //   }).to('.box', 1, {
      //     x: 800,
      //     opacity: 0.7,
      //     delay: 1,
      //     ease: Linear.easeNone,
      //   }).to('.box', 2, {
      //     x: 3000,
      //     opacity: 1,
      //     ease: Linear.easeNone,
      //   }).to('.box', .1, {
      //     x: 3001,
      //     opacity: 0,
      //     ease: Linear.easeNone,
      //   }).to('.box', .1, {
      //     x: 0,
      //     opacity: 0,
      //     ease: Linear.easeNone,
      //   })

    },
    addDiyCarts(val) {


    },
    currentProduct() {},
  },
  computed: {
    countNum() {
      return this.cartsList.length;
    },
    countTotalPrice() {
      let total = 0;
      for (let num in this.cartsList) {
        total += this.cartsList[num].price;
      }
      return total;
    },
    countTotalPoint() {
      let total = 0;
      for (let num in this.cartsList) {
        total += this.cartsList[num]['points'];
      }
      return total;
    },
  },
  mounted() {

    axios.get(`./assets/php/nofunctionConnProduct.php`).then((item) => {
      return item.data;
    }).then((item) => {
      let newList;
      newList = item.map((product) => {
        let thisSeriesIndex = parseInt(product[`product_series`]) - 1;
        thisSeriesIndex.toString();
        let thisPoints = parseInt(product['product_points']);
        let thisPrice = parseInt(product['product_price'])
          // 系列Id若是單位數，前面加0
        let thisSeriesId;
        if (product[`product_seriesid`].length === 1) {
          thisSeriesId = 0 + product[`product_seriesid`];
        } else {
          thisSeriesId = product[`product_seriesid`];
        }
        return {
          // 回傳之屬性跟值
          name: product[`product_name`].trim(),
          eName: product['product_ename'].trim(),
          series: this.seriesList[thisSeriesIndex].eName,
          seriesIndex: thisSeriesIndex,
          seriesId: thisSeriesId,
          imgURL: product['product_img'],
          displayImgURL: product['product_img1'],
          productId: product['product_id'],
          year: product['product_year'],
          size: product['product_size'],
          price: thisPrice,
          points: thisPoints,
          description: product['product_des'],
          limitLabel: product['product_spec'],
          productNum: 1,
          totalPrice: 0,
          totalPointCost: 0,
        }
      })
      this.productsList = newList;
    });
    this.cartsList = JSON.parse(localStorage.getItem('cartsList')) || [];



    // 抓取會員現有點數
    const params = new URLSearchParams()
    params.append('ID', this.memberId)

    axios({
      method: 'post',
      url: 'assets/php/getMemberPoints.php',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      data: params,

    }).then((res) => {

      let memberPoints = res.data[0]['member_points'];

      this.memberPoints = parseInt(memberPoints);
      console.log('目前會員點數', this.memberPoints);
      this.$store.commit('setMemberPoint', this.memberPoints);

    }).catch((error) => {
      console.log(error)

    })

  },
  watch: {
    cartsList: {
      handler() {
        this.cartNum++;
      }
    },
  },

  // 問學長： 動畫bug 位置bug 購買流程加入購物車後傳值？ 輪播動畫
}