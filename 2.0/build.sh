cat VJ.base.js VJ.config.js VJ.collection.js VJ.middler.js VJ.ni.js VJ.viewmodel.js VJ.view.js > VJ.js
java -jar ../YUI/yuicompressor-2.4.8.jar --type js --charset utf-8 -v VJ.js > VJ.min.js
