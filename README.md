#Author: Prashant Shinde

Repository includes code & output for:

1. Build Markov Chain State-Space model from scratch in Python

2. Using ChannelAttribution R package: Build simple heuristic & probabilistic models
    1. First Click / first_touch (Heuristic Model) 
    2. Last Click / last_touch (Heuristic Model) 
    3. Linear Attribution / linear_touch) (Heuristic Model) 
    4. Markov Model (Probabilistic Model) 




What is a Heuristic Model?

Some problems are hard and you may not be able to get an acceptable solution in an acceptable time. In such cases you often can get a not too bad solution much faster, by applying some arbitrary choices (educated guesses): that's a heuristic.
A heuristic is still a kind of an algorithm, but one that will not explore all possible states of the problem, or will begin by exploring the most likely ones.
Typical examples are from games. When writing a chess game program you could imagine trying every possible move at some depth level and applying some evaluation function to the board. A heuristic would exclude full branches that begin with obviously bad moves.
In some cases you're not searching for the best solution, but for any solution fitting some constraint. A good heuristic would help to find a solution in a short time, but may also fail to find any if the only solutions are in the states it chose not to try.

Refer:
http://setosa.io/ev/markov-chains/
https://www.bounteous.com/insights/2016/06/30/marketing-channel-attribution-markov-models-r/?ns=l
https://www.r-bloggers.com/attribution-model-with-r-part-1-markov-chains-concept/
https://analyzecore.com/Notes
https://analyzecore.com/2016/08/03/attribution-model-r-part-1/
https://analyzecore.com/2017/05/31/marketing-multi-channel-attribution-model-r-part-2-practical-issues/

Package Specifications:
https://cran.r-project.org/web/packages/ChannelAttribution/ChannelAttribution.pdf

Notes:
Alternative to 'Markov Chain state-space' model is 'Shapley value' model
