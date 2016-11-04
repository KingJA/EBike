
//完整的CKEditor的配置选项在 这里。下面是一些常用的配置。
//
//language，defaultLanguage，contentLanguage, uiColor
//autoGrow_maxHeight, autoGrow_minHeight, resize_maxHeight, resize_minHeight, resize_maxWidth, resize_minWidth
//toolbarCanCollapse, toolbarGroups
//forcePasteAsPlainText, pasteFromWordKeepsStructure, pasteFromWordRemoveFontStyles, pasteFromWordRemoveStyles
//font_names, fontSize_sizes
CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
    //config.uiColor = '#AADC6E';
	//其他一些配置
    filebrowserBrowseUrl = '../ckfinder/ckfinder.html';
    filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images';
    filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash';
    filebrowserUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Files';
    filebrowserImageUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Images';
    filebrowserFlashUploadUrl = '/ckfinder2.3.1/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};
