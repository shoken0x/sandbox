import os
from openai import OpenAI

client = OpenAI(api_key=os.environ["OPENAI_API_KEY"])

response = client.chat.completions.create(model="gpt-4o-mini",
# messages=[ {"role": "user", "content": "日本の総理大臣は誰ですか？"}, ])
messages=[
    {"role": "user", "content": "大谷翔平について教えて"},
    {"role": "assistant", "content": "日本のプロ野球選手であり、メジャーリーグ（MLB）のドジャースに所属する、投手と designated hitter（DH）の両方をこなす二刀流選手です。2018年にMLBデビューし、日米通算で2021年シーズン終了時点で通算115本塁打、86盗塁、41勝30敗、ERA3.65を記録しています。2021年にはホームランダービーで優勝し、オールスターゲームでも先発出場を果たすなど、メジャーリーグでもその才能を発揮しています。また、彼は高校時代には投打に優れ、日本プロ野球の日本ハムファイターズで投手としてプロデビューしました。"},
    {"role": "user", "content": "具体的な記録は？"},
    ],
)
print(response.choices[0].message.content.strip())
