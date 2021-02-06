const {
    src,
    series,
    dest,
    parallel,
    watch,
} = require('gulp');
//先把方法import出來

function func01(cb) {
    console.log('任務一');
    cb();
}

function func02(cb) {
    console.log('任務二');
    cb();
}

var concat = require('gulp-concat');
exports.move = function move(){
    return src('./css/move.html').pipe(dest('dist/'));
}

exports.concatfile = function all() {
    return src('css/*.css')
    .pipe(concat('style.css'))
    .pipe(dest('css/all/'))
}

exports.mergeCSS = function all(){
    return src(['main.css', 'main2.css']).pipe(concat('all.css')).pipe(dest('dist/'));
}//src放來源檔案，若複數放陣列

exports.order = series(func01, func02); //order為自行命名變數 執行時終端機打 gulp order
exports.paral = parallel(func01, func02);   //parallel  可同時執行
exports.all = series(func01, parallel(func01, func02)); //series可一個接一個執行
//minify css
//引入套件
const cleanCSS = require('gulp-clean-css');

exports.minicss = function minifycss(){ 
    return src(['css/*.css','css/!aa.css',],{allowEmpty: true })  //來源檔案
    .pipe(concat('style.css')) // 合併
    .pipe(cleanCSS()) //壓縮
    .pipe(dest('css/minify')) //放到該層目錄
}


//sass 編譯
//套件的引入
const sass = require('gulp-sass');
const sourceMap = require('source-map');



//編譯前的檔案位址
var sourcemaps = require('gulp-sourcemaps');
function sassStyle(){
    return src('dev/sass/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass({ //編譯sass成css
        outputStyle: "compressed"   // nested巢狀  // compressed壓縮  //expanded 原本
    }).on('error', sass.logError))
    .pipe(sourcemaps.write()) //sass map
    .pipe(dest('css/'))
}

const fileinclude = require('gulp-file-include');
function includeHTML() {
    return src('dev/*.html')
        .pipe(fileinclude({
            prefix: '@@',
            basepath: '@file'
        }))
        .pipe(dest('./dist'));
}

//監聽 scss
exports.w = function watchfile(){
    watch('dev/sass/*.scss' , sassStyle);
    watch('dev/*.html' , includeHTML);
}



// const fileinclude = require('gulp-file-include');








