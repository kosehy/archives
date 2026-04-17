# 金谷园饺子馆 AI Skill

Source: https://github.com/JinGuYuan/jinguyuan-dumpling-skill
Saved: 2026-04-13

这是一个 AI Skill——安装后，你的 AI 助手就能查询金谷园饺子馆的信息：在哪吃、几点开门、怎么排队、能不能外卖、生饺子怎么煮、Wi-Fi 密码是什么。还能直接帮你在美团上排队取号。

快20年的饺子馆，现在有了自己的AI服务。

北邮旁边的饺子馆。

## 项目概况

- 餐厅名称：金谷园饺子馆
- 营业时间：10:00 - 22:00（以实际查询为准）
- 北邮店：杏坛路文教产业园K座南2层
- 五道口店：五道口东源大厦4层

## 能力

金谷园饺子馆的官方信息服务，包含 5 项 MCP 查询能力 + 1 项内嵌排队能力：

- 餐厅信息
  - 你可以问：“金谷园在哪？” “几点开门？”
  - 来源：MCP
- 外卖服务
  - 你可以问：“能送外卖吗？” “怎么点外卖？”
  - 来源：MCP
- 生饺子打包
  - 你可以问：“能打包吗？” “生饺子怎么煮？”
  - 来源：MCP
- 店内 Wi-Fi
  - 你可以问：“Wi-Fi密码多少？”
  - 来源：MCP
- 最新消息
  - 你可以问：“有什么新活动？”
  - 来源：MCP
- 在线排队取号
  - 你可以问：“帮我排个队” “取消排队” “排队进度”
  - 来源：内嵌 Skill

本 Skill 内嵌了基于美团排队的取号能力，AI 助手可以直接帮你完成排队全流程，无需打开美团 App。

## 支持的排队操作

- 查询排队状态
  - 说明：查看门店是否支持排队、可选桌型
  - 你可以说：“金谷园现在排队情况怎么样？”
- 取号
  - 说明：选择桌型和人数，在线取号
  - 你可以说：“帮我在北邮店排个队，2个人”
- 查询进度
  - 说明：查看当前排队号、前方等待桌数
  - 你可以说：“我前面还有几桌？”
- 取消排队
  - 说明：取消已有的排队订单
  - 你可以说：“取消排队”

## 使用流程

- 告诉 AI 助手你要排队，说明门店（北邮店 / 五道口店）
- AI 查询可选桌型，跟你确认桌型和人数
- 确认后自动取号，返回排队号和等待信息
- 随时可查进度或取消

首次使用需完成美团账号授权（AI 助手会引导你完成），同一会话内无需重复登录。

注意：排队取号为真实业务操作，取号和取消前 AI 助手会跟你确认。排队能力由内嵌的 `meituan-queue` 组件提供，与本 Skill 版本独立演进。

## 仓库结构

```text
jinguyuan-dumpling-skill/
├── SKILL.md
├── skill.json
├── scripts/
├── references/
│   └── meituan-queue/
│       ├── SKILL.md
│       ├── scripts/
│       └── references/
├── README.md
└── LICENSE
```

## 安装方式

直接拷贝下面这句话发给你的 AI 助手：

> 帮我安装金谷园饺子馆 Skill，仓库地址：https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill

Agent 会自动克隆仓库并安装到对应的 Skill 目录。

也可以手动克隆到 Skill 目录。不同 IDE 对应路径包括：

- Qoder: `.qoder/skills/jinguyuan-dumpling-skill/`
- Cursor: `.cursor/skills/jinguyuan-dumpling-skill/`
- Trae: `.trae/skills/jinguyuan-dumpling-skill/`
- Windsurf: `.windsurf/skills/jinguyuan-dumpling-skill/`
- Claude Code: `.claude/skills/jinguyuan-dumpling-skill/`
- 通用: `.agents/skills/jinguyuan-dumpling-skill/`

示例：

```bash
git clone https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill.git \
  .qoder/skills/jinguyuan-dumpling-skill
```

只要目录下有 `SKILL.md`，Agent 下次启动就会自动加载这个 Skill。

## 链接与元数据

- GitHub: https://github.com/JinGuYuan/jinguyuan-dumpling-skill
- Gitee: https://gitee.com/JinGuYuan/jinguyuan-dumpling-skill
- 协议：MCP (Model Context Protocol)
- 传输：Streamable HTTP
- 部署：Tencent CloudBase 云函数
- 当前版本：0.3.3

说明：本 Skill 版本（0.3.3）与内嵌排队组件（`meituan-queue`）版本独立演进，互不影响。
