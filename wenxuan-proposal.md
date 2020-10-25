# Problem Statement
- This project explores automatic discovery of player-oriented strategies on 
[logic puzzles](https://en.wikipedia.org/wiki/Category:Logic_puzzles) that are 
solved by players using mathematical deduction. Specifically, Soduku is the 
target domain in this project. To solve this problem, I need to use program 
synthesis to generate programs that individually represents a sound, 
interpretable, and perhaps general and concise strategy. Concretely, give a:
    - formal decription of a problem domain (set of possible states, a valid 
    transition function between states, and a goal predicate to denote the end 
    of the solving process).
    - DSL for representing strategies.
    - Objective function that measures the conciseness and generalizability 
    for ranking strategies.
    - Training set and test set.

I need to find a strategy set (optimal hopefully) according to the objective 
function. 

# Motivation 
- In contrast to the way that computers use to solve puzzles (exponential 
search, backtracking), human employ a rich structure of domain-specific 
knowledge and strategies that are not explicitly stated in the game's rules. 
However, current human-interpretable strategies are handcrafted heuristics
that lack automation. This project bridges the gap by implementing a framework 
that not only can automatically generate strategies for Soduku, but for any 
logic puzzles as well. 
- This project extends the previous work on synthesizing strategies for 
[Nonogram](https://dl.acm.org/doi/10.1145/3102071.3102084) by focusing on a 
more complex problem domain, namely, Soduku. The Soduku board has 9 * 9 grids, 
with each grid can contain number 1-9, whereas Nonogram may have smaller board 
and each grid can only contain 2 possible inputs (filled vs not filled). 
Moreover, the previous work only considers generating strategies for a single 
row. However, most logic puzzles have strategies about a row and a column. 
Soduku in addition have rules and strategies about a 3-by-3 subgrid. So I 
would argue that strategies concerning in the previous work are limited. If 
this project can show some success in generating strategies for Soduku, this 
will show promise in program synthesis in knowledge learning in more complex 
systems. 
- Applications such as difficulty estimation, puzzle generation, and game 
progression analysis are enabled by automatic discovery of player-oriented 
strategies. 

# Resources 
- The previous work mentioned above has a well-maintained repository in 
[github](https://github.com/edbutler/nonograms-rule-synthesis).

- A [program synthesis tool](https://github.com/emina/rosette). 

# Things to be built
- A DSL for the problem domain.
- A Soduku state representation 
- An objective function
- The training and testing pipeline

# Evaluation 
- To evaluate the effectiveness of the generated strategies, I focus on two
parts:
    1. Can the system recover known strategies? There exists a database for 
    Soduku strategies. I will classify the strategies based on their range. 
    Some strategies are about a single row, some are about multiple rows and 
    so on so forth. I will also classify them based on the difficulty level of 
    the puzzle they appear in. The reason for doing that is I want to see the 
    distribution of the recovered (unrecovered) strategies.
    
    2. How does the learned strategy set compare to the known strategies when 
    measuring coverage of the testing data. The learned ones may not include 
    all of the known strategies, but might cover more game states than known 
    strategies. 

# Stages

## Stage 1
- Learn the basics of Racket and how to use Rosette, the open source 
synthesis tool in Racket.
- Think of ways to succintly represent game states and game rules. The  
previous work failed to do so on Soduku. 
- Grep a collection of known strategies from sources and classify them.  
- Find training examples and testing examples. 
- Design the DSL so that the DSL contains interpretable building blocks. 
 
## Stage 2
- Implement the DSL
- Use the synthesis tool to generate programs that encode strategies.
- Think of the objective function to rank the programs.

## Stage 3
- Evaluate the effectiveness of the system based on the two metrics 
- Develop a visualization tool of the strategies and maybe also the puzzle 
solving process. 