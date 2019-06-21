library(learnr);

data <-list(questions=NA,answers=NA);
data$questions <-data.frame(FInterId=1:2,FText=c('Which package contains functions for installing other R packages?',
                                              'Which of the R packages listed below are used to create plots?'),
                            stringsAsFactors = F);

View(data$questions)
data$answers <- data.frame(FInterId=c(rep(1,4),rep(2,4)),
                            FEntryId=rep(1:4,2),
                            FText=c("base",'tools',
                              'utils',
                              'codetools',
                              'lattice','tools',
                              'stats',
                              'grid'),
                            FFlag=c(
                              F,F,T,F,
                              T,0,0,T
                            )
                                     );
View(data$answers);
quizDemoData <-data;
devtools::use_data(quizDemoData,overwrite = T);

library(learnr);
data('quizDemoData')
getQuizList(quizDemoData);
