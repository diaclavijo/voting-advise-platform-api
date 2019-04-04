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


## GET /result
### Response
HTTP Code: 200
... Massi knows



