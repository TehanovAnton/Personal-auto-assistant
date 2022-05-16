
query_string = "
  user(id: 1) {
    id
    first_name
    last_name
    email
  }
"

p Schema.execute(query_string)