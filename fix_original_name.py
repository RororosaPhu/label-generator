# 修復 app.py 以保留完整的原始文件名

with open('app.py', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# 找到並修改相關行
new_lines = []
for i, line in enumerate(lines):
    if 'def generate_pdf(excel_path, output_path):' in line:
        new_lines.append(line)
        # 添加 original_filename 參數
        new_lines[len(new_lines)-1] = 'def generate_pdf(excel_path, output_path, original_filename=None):\n'
    elif 'base_name = os.path.splitext(os.path.basename(excel_path))[0].strip()' in line:
        # 使用原始文件名或從路徑提取
        new_lines.append('    if original_filename:\n')
        new_lines.append('        base_name = os.path.splitext(original_filename)[0].strip()\n')
        new_lines.append('    else:\n')
        new_lines.append('        base_name = os.path.splitext(os.path.basename(excel_path))[0].strip()\n')
    elif 'count = generate_pdf(excel_path, pdf_path)' in line:
        # 傳入原始文件名
        new_lines.append('            count = generate_pdf(excel_path, pdf_path, filename)\n')
    else:
        new_lines.append(line)

with open('app.py', 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print("✅ 修復完成！")
