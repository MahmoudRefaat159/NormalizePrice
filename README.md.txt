
🧾 SQL Function: NormalizePrice
📌 Purpose:
This function standardizes a price string by removing currency symbols (like €) and converting European-style decimal formats into a normalized dot-separated decimal format.

✅ Use Case:
Some prices may appear as:

"€1.234,56" → should be normalized to "1234.56"

"1,234.56" → should become "1234.56"

"1,234" → becomes "1234"

"123,45" → becomes "123.45"

This function ensures consistency for further processing or numeric conversion.

📥 Input:
sql

@price NVARCHAR(50)
A price string, possibly containing:

Currency symbols (like €)

Thousand separators (commas or dots)

Decimal indicators (commas or dots)

