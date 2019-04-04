# Use cases
## MVP
Given I am a user I visit the homepage
then i see a explanation
then click next
then question
then I choose yes
then i see another question and so on...
when I reply to the last question
then we show the results

## nice to have

### Fetching age and genre
when I reply to the last question
**
then we ask for the age and genre
it can be skipped
**
then we show the results


### objective final
As a user I can create my own form, with my own political parties and political
parties answers

= Users table 




# Agreement Calculator formula

Given a user anser and a political party answer, how the score is calculated

user	 	|	 political party  |  D  | DisPos
-------------------------------------------------
yes     |  yes              | 0   | 2
yes     |  don't care       | 1   | 1
yes     |  no               | 2   | 0
no      |  yes              | 2   | 0
no      |  don'tcare        | 1   | 1
no      |  no               | 0   | 2
dont ca |  yes              | 1   | 1
dont ca |  dont             | 0   | 2
dont ca |  no               | 1   | 1


### Cat party results
Result = 4 

#### Prohibit cats to run? 
You said no and cats said no. => +2  





user_reply |  Politcal Party | Reply | Score
----------------------------------------------
Yes        |   PPA           | Yes   | 2


yes     don'care    no


1-------- 0 ---------- -1


# App tables


=Questions * 
- id
- title
2nd iteration
- body

=Answers *
- id
- questionId
- userId
- vote

 
=PoliticalParty * 
- id
- name

=PartyAnswer 
- id
- questionId
- political party id 
- vote
 
=User * 
- identifier (session identifier)
- email
- age
- genre



# Alternative option for voting

userA:
- partyA: 80
- partyB: 85
- partyC: 0

open immigrants
fully open - partyA: 2, partyB: -2, partyC: 1
open - partyA: 1, partyB: -1, party: 0.5
medium - partyA: 0, partyB: 0, C: 0
close - partyA: -1, partyB: 1, C: -0.5
really close - partyA: -2, partyB: 0, C: -1


100






