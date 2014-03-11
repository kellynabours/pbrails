/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.width=500;
        config.resize_minWidth=0;
        config.resize_minHeight=0;
	config.toolbar="Pb";
	config.toolbar_Pb=
	[
		['Bold','Italic','Underline','Strike','RemoveFormat'],
    		[ 'Source','-','PasteText','PasteFromWord' ] ,
		['SpellChecker','Scayt'],
		['FontSize']
	];


};
