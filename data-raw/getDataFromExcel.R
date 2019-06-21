library(readxl)
questions <- read_excel("./data-raw/quizTemplate.xlsx", 
                           sheet = "questions")
questions <- as.data.frame(questions);
# View(questions)
# library(readxl)
answers <- read_excel("./data-raw/quizTemplate.xlsx", 
                        sheet = "answers")
answers <- as.data.frame(answers);
# View(answers)

data <- list(questions=questions,answers=answers);

library(learnr)
getQuizList(data);

