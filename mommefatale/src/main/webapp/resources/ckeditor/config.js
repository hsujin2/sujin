/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	 config.filebrowserBrowseUrl ='/mommefatale/resources/ckfinder/ckfinder.html';
	 config.filebrowserImageBrowseUrl ='/mommefatale/resources/ckfinder/ckfinder.html?type=Images';
	 config.filebrowserUploadUrl ='/mommefatale/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	 config.filebrowserImageUploadUrl ='/mommefatale/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
};
