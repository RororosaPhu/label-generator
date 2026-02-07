import sys

# 讀取 app.py
with open('app.py', 'r', encoding='utf-8') as f:
    content = f.read()

# 替換代碼
old_code = '''        title = f"{base_name} - {trans_no}"'''

new_code = '''        # 去掉UUID前綴，只保留原始文件名
        if "_" in base_name and len(base_name.split("_")[0]) == 36:
            original_name = "_".join(base_name.split("_")[1:])
        else:
            original_name = base_name
        
        title = f"{original_name} - {trans_no}"'''

content = content.replace(old_code, new_code)

# 寫回文件
with open('app.py', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ 修復完成！")
