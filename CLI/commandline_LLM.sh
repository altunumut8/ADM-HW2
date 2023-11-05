jq -r 'select(type == "object") | {id: .id, title: .title, total_books_count: (.works | map(.books_count | tonumber) | add)}' series.json | jq -s 'sort_by(.total_books_count) | reverse | .[:5]'