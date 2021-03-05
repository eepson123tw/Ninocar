  let cartMixins = {
    data() {
      return {
        cartsList: [],
        cartNum: 0,

      }
    },
    methods: {
      addCarts(val) {

        this.cartsList.push(val);

        let cartJson = JSON.stringify(this.cartsList);
        localStorage.setItem('cartsList', cartJson);

        const runcart = new TimelineMax({});
        runcart.to('.box', .3, {
          x: 500,
          opacity: 0,
          ease: Linear.easeNone,

        }).to('.box', 1, {
          x: 800,
          opacity: 0.7,
          delay: 1,
          ease: Linear.easeNone,
        }).to('.box', 2, {
          x: 3000,
          opacity: 1,
          ease: Linear.easeNone,
        }).to('.box', .1, {
          x: 3001,
          opacity: 0,
          ease: Linear.easeNone,
        }).to('.box', .1, {
          x: 0,
          opacity: 0,
          ease: Linear.easeNone,
        })

      },
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


    },
    mounted() {
      this.cartsList = JSON.parse(localStorage.getItem('cartsList')) || [];
      console.log(this.cartsList.length);
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