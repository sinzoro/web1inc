function on_key_up(obj, leng) {
	var keycode = event.keyCode;
	if ( keycode == 8 || keycode == 116) event.returnValue = false; // 브라우저 기능 키 무효화 // 백스페이스 , F5
	if ((objByte = stringByteSize(obj.value)) > leng) {
		var i=1;
		do{
			strTemp = obj.value.substr(0,obj.value.length-i);
			if((objByte = stringByteSize(strTemp)) <= leng){
				obj.value = strTemp;
			}else{
				i++;
			}
		}while(stringByteSize(strTemp) > leng);
	}
	document.getElementById(obj.id+"_byteCheck").value = "(" + objByte +"/"+ leng +")";
}
function charByteSize(ch) {
	if (ch == null || ch.length == 0)return 0;
	var charCode = ch.charCodeAt(0);
	if (charCode <= 0x00007F) {
	  return 1;
	} else if (charCode <= 0x0007FF) {
	  return 2;
	} else if (charCode <= 0x00FFFF) {
	  return 3;
	} else {
	  return 4;
	}
}
function stringByteSize(str) {
	if (str == null || str.length == 0)return 0;
	var size = 0;
	for (var i = 0; i < str.length; i++) {
	  size += charByteSize(str.charAt(i));
	}
	return size;
}