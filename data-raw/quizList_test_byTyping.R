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

questionSet <- list(q1,q2,q3);
quizList(questionSet);

