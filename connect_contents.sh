#!/bin/bash

# 出力ファイル名を設定
OUTPUT_FILE="complete_book.md"

# 既存の出力ファイルがあれば削除
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# ファイルをナンバリング順にソートして連結
find . -maxdepth 1 -name "*.md" | sort -V | while read -r file; do
    # ファイル名を表示（進捗確認用）
    echo "Processing: $file"
    
    # ファイル名をヘッダーとして追加（オプション）
    echo -e "\n<!-- $file -->\n" >> "$OUTPUT_FILE"
    
    # ファイルの内容を連結
    cat "$file" >> "$OUTPUT_FILE"
    
    # ファイル間に区切り線を追加（オプション）
    echo -e "\n---\n" >> "$OUTPUT_FILE"
done

# 最後の区切り線を削除（オプション）
# sed -i '' -e '$ d' "$OUTPUT_FILE"

echo "Complete book has been created as $OUTPUT_FILE"