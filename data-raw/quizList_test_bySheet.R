bb <-list(
  answer(text="可以先生成凭证，再进行入库核算", correct = TRUE),
  answer(text="先入库核bbb算，再出库核算"),
  answer(text="出库成bbb本核算后先检查合法性报告"),
  answer(text="次月入库，当月出库也可以进行成本成本核算", correct = TRUE))
q1<-questionList(text = "下面关于存货核算，错误的描述是",answerList = bb);

bb2 <-list(
  answer(text="222可以先生成凭证，再进行入库核算", correct = TRUE),
  answer(text="222先入库核bbb算，再出库核算"),
  answer(text="222出库成bbb本核算后先检查合法性报告"),
  answer(text="222次月入库，当月出库也可以进行成本成本核算", correct = TRUE))
q2<-questionList(text = "222下面关于存货核算，错误的描述是",answerList = bb2);
bb3 <-list(
  answer(text="333可以先生成凭证，再进行入库核算", correct = TRUE),
  answer(text="333先入库核bbb算，再出库核算"),
  answer(text="333出库成bbb本核算后先检查合法性报告"),
  answer(text="333次月入库，当月出库也可以进行成本成本核算", correct = TRUE))
q3<-questionList(text = "333下面关于存货核算，错误的描述是",answerList = bb3);



data1 <-data$questions;
data1;
getQuestionTextByID <- function(data1,FInterId)
{
  txt <- data1[data1$FInterId==FInterId,'FText'];
  return(txt)
}

getQuestionTextByID(data1,1);
data2 <-data$answers;
data2;
getAnswerTextByID<-function(data2,FInterId)
{
  txt<-data2[data2$FInterId == FInterId,'FText',drop=T];
  txt <- as.character(txt);
  return(txt);
}
getAnswerTextByID(data2,1);
getAnswerTextByID(data2,2);

getAnswerFlagById <- function(data2,FInterId){
  flag<-data2[data2$FInterId == FInterId,'FFlag',drop=T];
  flag <- as.logical(flag)
  return(flag);
  
}

getAnswerFlagById(data2,1);
getAnswerFlagById(data2,2);


questionSet <- list(q1,q2,q3);
quizList(questionSet);

getQuizList <- function(data){
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
      
    questionList(text = getQuestionTextByID(data1 = data$questions,i),answerList = answerList)
    
  })
  res <-quizList(questionSet)
  return(res)
  
}
getQuizList(data);

