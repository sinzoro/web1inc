


function filePlus(){
		
		//alert('filePlus');
		
		var fileGroup = document.getElementById('fileGroup');
		var divFile = document.createElement("div");
		var labelFile = document.createElement("label");
		var inputFile = document.createElement("input");
		var checkFile = document.createElement("input");
		
		var fileName = document.getElementsByClassName('fileName');
		var fileNameCount = fileName.length;
		var txtNode = document.createTextNode(" 파일명"+(fileNameCount+1)+" : ");
		var inerSpan = document.createElement("span");
		
		checkFile.setAttribute("type","checkbox");
		checkFile.setAttribute("class","fileNameCk");
		
		labelFile.setAttribute("for","fileNameLabel"+(fileNameCount+1));
		
		inerSpan.setAttribute("class","inerSpan");
		
		inputFile.setAttribute("type","file");
		inputFile.setAttribute("name","fileName"+(fileNameCount+1));
		inputFile.setAttribute("id","fileName"+(fileNameCount+1));
		inputFile.setAttribute("class","fileName");
		
		divFile.appendChild(checkFile);
		inerSpan.appendChild(txtNode);
		labelFile.appendChild(inerSpan);
		divFile.appendChild(labelFile);
		divFile.appendChild(inputFile);
		
		divFile.setAttribute("class","divFile");
		
		fileGroup.appendChild(divFile);
		
}

function fileMinus(){
	
	//ck value get
	var fileNameCk = document.getElementsByClassName('fileNameCk');
	var divFile = document.getElementsByClassName("divFile");
	var fileGroup = document.getElementById("fileGroup");
	//var txtNode = document.getElementsByClassName("txtNode");
	var inerSpan = document.getElementsByClassName("inerSpan");
	var inerTxt = document.getElementsByClassName("inerTxt");

	for( var i=0;i<fileNameCk.length;i++ ){
		if( fileNameCk[i].checked ){
			fileGroup.removeChild(divFile[i]);
			i--;
		}
	}
	
	for( var i=0;i<fileNameCk.length;i++ ){
		//if( !fileNameCk[i].checked ){
			inerSpan[i].textContent = ' 파일명'+(i+1)+' : ';
			//inerTxt[i].textContent = ' 파일명'+(i+1)+' : ';
		//}
	}
}

