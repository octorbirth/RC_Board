// 화면에 보여줄 파일명
// 실제 파일들을 볼 수 있는 파일명(DB에 등록된...)
// 이미지 파일인지 일반파일인지 판단할 수 있는 확장자명
// 썸네일 이미지명 처리
function getImgInfo(fullName){
		
	var fileName, thumbName;
	thumbName = "s_" + fullName;
	fileName = fullName.substr(fullName.indexOf("_")+1);
	
	return  {fileName:fileName,  thumbName:thumbName, fullName:fullName};
}
function getFileInfo(fullName){
	
	var fileName;
	fileName = fullName.substr(fullName.indexOf("_")+1);
	return  {fileName:fileName,  fullName:fullName};	
}


