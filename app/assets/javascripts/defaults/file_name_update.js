Site.fileNameUpdate = function(input) {
	var label	 = input.previousSibling,
	labelVal = label.innerHTML;

	var fileName = '';
	if( input.files && input.files.length > 1 )
		fileName = ( input.getAttribute( 'data-multiple-caption' ) || '{count} Files Selected' ).replace( '{count}', input.files.length );
	else
		fileName = input.files[0].name

	if( fileName )
		label.innerHTML = fileName;
	else
		label.innerHTML = labelVal;
}
