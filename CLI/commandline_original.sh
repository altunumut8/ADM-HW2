fd= jq 'select(type == "object") | {id: .id, title: .title, total_books_count: (.works | map(.books_count | tonumber) | add)}' series.json
fd_json=$(echo "$fd" | jq '.')
top_five_series=$(echo "$fd_json" | jq 'select(type == "object") | sort_by(.total_books_count) | reverse | .[:5]')
