# Voting Advise Platform Backend
Create your own polls and political parties answers for helping people to choose the right party.

The client is located at: 

This Rails API was sponsored by [Helpling](https://www.helpling.de/careers#positions) and 
developed inside [Tamedia Hackathon 19](https://harryf.github.io/tamedia-hackdays/). 

The project is still missing functionality, below the road map.

# Road map

* Refactor: ResultsController
* Support user authentication and registration. Currently it is using a uuid sent by the client
to identify the user. 
* Support Poll Edition
* Support Poll stats check: Check answers
* Ask the user filling the poll more data: age, genre and email.


# API Documentation

## Get the list of question of a poll
 
### Request 
GET /polls/:poll_id/questions
 
### Response
200
#### Body
```json
[
  {
    "id":  3,
    "title": "Question Title", 
    "body": ""
  },
  ...
]
```

## Answer a question 

### Request
POST /answers

### Params
vote might be 'yes', 'no' or 'neutral'.
```json
{
  "question_id": 2, 
  "vote": "yes"
}
```
### Response
#### Successfully updated
HTTP Code: 200
#### Question does not exists
HTTP Code: 404

## Request the results of a poll 
### Request 
GET /polls/:poll_id/result
### Response
HTTP Code: 200

```json
{  
   "parties":[  
      {  
         "name":"mice",
         "score":100.0,
         "questions":[  
            {  
               "id":156092651,
               "title":"Prohibit cats to run?",
               "user_vote":"yes",
               "party_vote":"yes"
            },
            {  
               "id":964373417,
               "title":"Prohibit mice to make holes?",
               "user_vote":"no",
               "party_vote":"no"
            }
         ]
      },
      {  
         "name":"cat",
         "score":0.0,
         "questions":[  
            {  
               "id":156092651,
               "title":"Prohibit cats to run?",
               "user_vote":"yes",
               "party_vote":"no"
            },
            {  
               "id":964373417,
               "title":"Prohibit mice to make holes?",
               "user_vote":"no",
               "party_vote":"yes"
            }
         ]
      }
   ]
}

```


## POST /polls
### Params
```json
{ 
  "questions": [
    { 
      "title":  "Brexit?",
      "body": "",
      "political_party_answers": [
        {
          "political_party_name": "laboral",
          "vote": "yes"
        },
        ...
      ]
    },
    { 
      "title":  "Brexit?",
      "body": "",
      "political_party_answers": [
        {
          "political_party_name": "laboral",
          "vote": "yes"
        },
        ...
      ]
    },
  ],
}
```

# Results calculation

Given a user answer and a political party answer, how the score is calculated

It is the distance between the two answers:
```
yes -------- neutral ---------- no

1   --------    0    ---------- -1

```


| user     | political party   | Distance  | Score (max distance - distance) |
|----------|-------------------|-----------|---------------------------------|
| yes      | yes               |    0      |                2                |
| yes      | neutral           |    1      |                1                |
| yes      | no                |    2      |                0                |
| no       | yes               |    2      |                0                |
| no       | neutral           |    1      |                1                |
| no       | no                |    0      |                2                |
| neutral  | yes               |    1      |                1                |
| neutral  | dont              |    0      |                2                |
| neutral  | no                |    1      |                1                |
