# API Documentation

## GET /questions
 
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

## POST /answers
### Params
```json
{
  "question_id": 2, 
  "vote": "yes/no/neutral"
}
```
### Response
#### Successfully updated
HTTP Code: 200
#### Question does not exists
HTTP Code: 404


## GET /results
### Response
HTTP Code: 200
```json
[ 
  {
    "question_id":  3,
    "user_vote": "Yes/No/Neutral", 
    "political_party": "Name",
    "political_vote": "Yes/No/Neutral",
    "score": 2
  },
  ... 
]
```




