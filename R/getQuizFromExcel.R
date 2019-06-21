
#' 用于从试题随机获取相应的数据
#'
#' @param data 符合模板格式的数据
#' @param maxCount 最大的抽样行数
#'
#' @return  返回经过随时抽样的数据结构
#'
#' @examples getSampeData(data,maxCount=20)
getSampleData <- function (data,maxCount=20){
  
  headData <- data$questions;
  # maxCount <-2;
  lenCount <-nrow(headData);
  res <-NA;
  if(lenCount <= maxCount){
    quesIndex <-1:lenCount;
    q1 <- data$questions
    FInterId<- q1$FInterId
    FText <- paste(quesIndex,'.',q1$FText);
    data$questions <- data.frame(FInterId=FInterId,FText =FText,stringsAsFactors = F);
    res <-data;
  }else{
    indexSet1 <- sample(x = headData$FInterId,size = maxCount,replace =F);
    data$questions <- data$questions[data$questions$FInterId %in% indexSet1,];
    data$answers <- data$answers[data$answers$FInterId %in% indexSet1,];
    quesIndex <-seq_along(indexSet1);
    q1 <- data$questions
    FInterId<- q1$FInterId
    FText <- paste(quesIndex,'.',q1$FText);
    data$questions <- data.frame(FInterId=FInterId,FText =FText,stringsAsFactors = F);
    res<-data
  }
  return(res);
}

 data('quizDemoData');
bb <-getSampleData(quizDemoData,2);

#' 直接从Excel中直接生产相应的列表
#'
#' @param file  包含目录在内的完整的相对路径
#' @param lang  语言，默认为en，其次是cn
#' @param caption  自定义标题
#' @param maxCount  定义可以选取的最大的行数
#'
#' @return  返回一个测试列表
#' @import readxl
#' @export
#'
#' @examples getQuizFromExcel(file='./data-raw/quizTemplate.xlsx',lang='en');
getQuizFromExcel <- function (file='./data-raw/quizTemplate.xlsx',lang='en',
                              caption='测试列表',maxCount=20){
  # library(readxl) 加载相应的文件
  if (lang =='en'){
    questions <- readxl::read_excel(file,sheet = "questions")
    questions <- as.data.frame(questions);
    answers <- readxl::read_excel(file, sheet = "answers")
    answers <- as.data.frame(answers);
    data <- list(questions=questions,answers=answers);
    data <- getSampleData(data,maxCount=maxCount);
  }else if (lang == 'cn'){
    # to be update
    questions <- read_excel(file,sheet = "问题")
    questions <- as.data.frame(questions);
    names(questions)<-c('FInterId','FText');
    answers <- read_excel(file, sheet = "答案")
    answers <- as.data.frame(answers);
    names(answers) <- c('FInterId','FEntryId','FText','FFlag');
    data <- list(questions=questions,answers=answers);
  }
   getQuizList(data,caption=caption);
}



