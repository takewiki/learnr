#' 根据FInterId获取相应的名称
#'
#' @param data1 问题列表的数据
#' @param FInterId 列表的问题
#'
#' @return 返回文本,内部函数不用于修改
#'
#' @examples getQuestionTextByID(data1,1);
getQuestionTextByID <- function(data,FInterId)
{
  txt <- data[data$FInterId==FInterId,'FText'];
  return(txt)
}

#' 用于获取选项列表的文本
#'
#' @param data  用于获取选择列表的数据
#' @param FInterId 用于内码的数据
#'
#' @return 返回相应的数据，内部函数，不再导出
#'
#' @examples getAnswerTextByID(data2,1);
getAnswerTextByID<-function(data,FInterId)
{
  txt<-data[data$FInterId == FInterId,'FText',drop=T];
  txt <- as.character(txt);
  return(txt);
}

#' 用于获取正确答案的数据
#'
#' @param data2 列表的数据
#' @param FInterId  内码
#'
#' @return 返回值，内部函数，不再导出
#'
#' @examples getAnswerFlagById(data2,1);
getAnswerFlagById <- function(data,FInterId){
  flag<-data[data$FInterId == FInterId,'FFlag',drop=T];
  flag <- as.logical(flag)
  return(flag);
  
}

#' 用于获取测试列表的主接口数据
#'
#' @param data 数据，一个列表，包含questions与answers两个页签
#' @param caption 自定义标题
#' @return 返回值
#' @include quizBatch.R
#' @export
#'
#' @examples getQuizList(data);
getQuizList <- function(data,caption='测试列表'){
  FInterIdSet <- unique(data$questions$FInterId);
  questionSet <- lapply(FInterIdSet,function(i){
       
    answerText <-getAnswerTextByID(data$answers,i)
    answerFlag <-getAnswerFlagById(data$answers,i)
    j <- length(answerText)
    t <- 1
    answerList <- list()
    while (t<=j){
      answerList[[t]] <-answer(text = answerText[t],correct = answerFlag[t])
      t = t+1 ;
    }
      
    questionList(text = getQuestionTextByID(data = data$questions,i),answerList = answerList)
    
  })
  res <-quizList(questionSet,caption=caption)
  return(res)
  
}


