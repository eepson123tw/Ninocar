const store = new Vuex.Store({ //global store
    state: { //類似 new Vue() 裡面的data
        seriesList: [{
            name: '工程系',
            eName: 'EN',
        }, {
            name: 'RV休旅系',
            eName: 'RV',
        }, {
            name: '計程車系',
            eName: 'TA',
        }, {
            name: '巴士系',
            eName: 'BS',
        }, {
            name: '警車系',
            eName: 'PA',
        }, {
            name: '消防救護系',
            eName: 'EM',
        }, {
            name: '轎車系',
            eName: 'CA',
        }, {
            name: 'PREMIUM系',
            eName: 'PM',
        }],
    },
    mutations: { //類似 new Vue() 裡面的methods


        testVueXConnect() {
            console.log('connecting')
        }

    }
});