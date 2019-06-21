#' 获取测试的模板数据，提供中英文2种格式
#'
#' @param path 文件的路径，默认为当前项目目录
#' @param lang 语言的内容，默认为英文，也可以为中文，指定为cn即可
#'
#' @return 实际没有返回值,后续考虑完善
#' @import openxlsx
#' @export
#'
#' @examples #getQuizTemplate(lang='cn');
getQuizTemplate <-function(path='./',lang='en'){
  fileName <- 'quiz_template.xlsx';
  fileName_cn <- '测试模板数据.xlsx';
  sheetName_cn <- c('问题','答案');
  quesFieldList <- c('问题编号','问题描述');
  answFieldList <- c('问题编号','答案行号','答案描述','答案标记');
  # path='./';
  fullPath <- paste(path,fileName,sep="");
  fullPath_cn <- paste(path,fileName_cn,sep="");
  if (lang == 'en'){
    openxlsx::write.xlsx(sysQuizTemplateData,fullPath);
  }else if (lang == 'cn'){
    testData <- sysQuizTemplateData
    names(testData$questions) <- quesFieldList;
    names(testData$answers) <- answFieldList;
    names(testData)  <- c('问题','答案');
    #str(testData);
    openxlsx::write.xlsx(testData,fullPath_cn);
  }else{
    warning('something wrong happened!')
  }
}

