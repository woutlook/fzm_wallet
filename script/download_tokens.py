import requests
import os
import json

# API URL 和输出文件路径
api_url = "https://www.mydao.plus/v2api/interface/wallet-coin/search"
output_file = "../assets/data/token_list.json"
image_save_path = "../assets/icons"  # 图标保存的目录

# 请求头和请求体
headers = {
    "FZM-PLATFORM-ID": "1",
    "Content-Type": "application/json"
}
data = {
    "limit": "200",
    "page": "1"
}

# 确保图标保存目录存在
os.makedirs(image_save_path, exist_ok=True)

def download_image(url, save_path):
    """下载图片到指定路径"""
    try:
        response = requests.get(url, stream=True)
        if response.status_code == 200:
            with open(save_path, "wb") as file:
                for chunk in response.iter_content(1024):
                    file.write(chunk)
            print(f"图标已下载: {save_path}")
            return True
        else:
            print(f"无法下载图标: {url}，状态码: {response.status_code}")
            return False
    except Exception as e:
        print(f"下载图片时出错: {e}, URL: {url}")
        return False

def process_tokens(data):
    """处理 token 列表，下载图标并更新路径"""
    tokens = data.get("data", [])
    newToknes = []
    for token in tokens:
        icon_url = token.get("icon")
        if icon_url:
            # 提取文件名并设置本地保存路径
            filename = os.path.basename(icon_url)
            local_icon_path = os.path.join(image_save_path, filename)
            
            # 下载图标
            if download_image(icon_url, local_icon_path):
                # 更新 token 的图标路径为本地路径
                token["icon"] = os.path.join("assets/icons", filename)
                newToknes.append(token)
    return newToknes 

try:
    # 调用 API 获取数据
    response = requests.post(api_url, json=data, headers=headers)
    if response.status_code == 200:
        response_data = response.json()
        
        if response_data.get("code") == 0:
            # 解析并处理 token 数据
            tokens = process_tokens(response_data)
            
            # 保存更新后的 token 列表到文件
            with open(output_file, "w", encoding="utf-8") as file:
                json.dump({
                    "tokens": tokens,
                }, file, ensure_ascii=False, indent=4)
            print(f"处理完成，新文件已保存为: {output_file}")
        else:
            print(f"API 返回错误: {response_data.get('msg')}")
    else:
        print(f"请求失败，状态码: {response.status_code}")
except Exception as e:
    print(f"请求时出错: {e}")
