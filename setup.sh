#!/bin/bash
# 快速部署指南 - 一馬速運標籤生成器

echo "================================================"
echo "  一馬速運標籤生成器 - 快速部署助手"
echo "================================================"
echo ""

# 檢查Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 未找到Python3，請先安裝Python"
    exit 1
fi

echo "✅ Python已安裝: $(python3 --version)"
echo ""

# 檢查必需文件
echo "檢查必需文件..."

if [ ! -f "static/一马速运横.png" ]; then
    echo "⚠️  警告: 缺少 static/一马速运横.png"
    echo "   請將Logo圖片放入 static/ 文件夾"
    MISSING=true
fi

if [ ! -f "static/NotoSansSC-Black.ttf" ]; then
    echo "⚠️  警告: 缺少 static/NotoSansSC-Black.ttf"
    echo "   請將字體文件放入 static/ 文件夾"
    MISSING=true
fi

if [ "$MISSING" = true ]; then
    echo ""
    echo "請先添加缺少的文件，然後重新運行此腳本"
    exit 1
fi

echo "✅ 所有必需文件已就緒"
echo ""

# 創建虛擬環境
echo "創建虛擬環境..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✅ 虛擬環境已創建"
else
    echo "✅ 虛擬環境已存在"
fi
echo ""

# 激活虛擬環境並安裝依賴
echo "安裝依賴包..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
echo "✅ 依賴包安裝完成"
echo ""

echo "================================================"
echo "  🎉 本地測試環境準備完成！"
echo "================================================"
echo ""
echo "接下來："
echo "1. 本地測試："
echo "   python app.py"
echo "   然後在瀏覽器訪問: http://localhost:5000"
echo ""
echo "2. 部署到雲端（3個選擇）："
echo "   📘 Render.com (推薦-免費)"
echo "      → 查看 README.md 中的「方案一」"
echo ""
echo "   🚂 Railway.app (推薦-體驗最好)"
echo "      → 查看 README.md 中的「方案二」"
echo ""
echo "   🐍 PythonAnywhere (永久免費)"
echo "      → 查看 README.md 中的「方案三」"
echo ""
echo "詳細部署步驟請查看 README.md 文件"
echo "================================================"
