library(learnr);
bb<-quiz(
  question("下面哪一项不是R语言的最基本数据类型?",
           answer("字符character"),
           answer("数值numeric"),
           answer("日期Date", correct = TRUE),
           answer("整数integer")
  ),
  question("下面关于存货核算，错误的描述是",
           answer("可以先生成凭证，再进行入库核算", correct = TRUE),
           answer("先入库核算，再出库核算"),
           answer("出库成本核算后先检查合法性报告"),
           answer("次月入库，当月出库也可以进行成本成本核算", correct = TRUE)
  )
);
bb;
?? answer;


question("What number is the letter A in the alphabet?",
         answer("8"),
         answer("14"),
         answer("1", correct = TRUE),
         answer("23"),
         incorrect = "See [here](https://en.wikipedia.org/wiki/English_alphabet) and try again.",
         allow_retry = TRUE
)
