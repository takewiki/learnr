library(learnr);
data('quizDemoData')
getQuizList(quizDemoData);
quizDemoData;
library(openxlsx);
write.xlsx(quizDemoData,'./data-raw/quizDemoData.xlsx');


testData <- sysQuizTemplateData;
str(testData);
names(testData$questions) <- quesFieldList;
names(testData$answers) <- answFieldList;
names(testData)  <- c('问题','答案');
str(testData);




