Below is a **production-level UI/UX specification** for **Quitra**, aligned with
your stack (**Flutter + Bloc + offline-first**) and your product strategy
(**behavior-change, not just tracking**).

This is structured so you can **directly implement screens and flows** without
ambiguity.

---

# 📱 Quitra — UI/UX Design Document

---

# 1. 🧠 UX Philosophy (Non-Negotiable)

### Core Principle:

> The app must be most useful **at the moment of craving**

---

## UX Goals:

- **< 2 seconds to action**
- **Zero friction interactions**
- **Emotionally supportive**
- **Minimal cognitive load**

---

## UX Anti-Patterns (avoid these):

- ❌ Too many stats on home
- ❌ Long forms
- ❌ Guilt-driven messages
- ❌ Deep navigation for critical actions

---

# 2. 🗺️ App Structure (Navigation)

---

## Bottom Navigation (4 tabs max):

1. **Home**
2. **Progress**
3. **Journey**
4. **Settings**

👉 Keep it flat. No nested complexity.

---

# 3. 🧩 Screen-by-Screen Design

---

# 3.1 🏠 Home Screen (MOST IMPORTANT)

![Image](https://images.openai.com/static-rsc-4/u_OCvNfSNbIVfPjbD8y8Mx50kHC9Nt7m4dBAvR4N5khXAze-lHZBa8zV_wJJ-ugvpWqDBvG9mXQg4x7I_kXqnWphwY82rAthjjlYnx7VlnhXtd8Z71uDZD9zFda2UwQltuA8phymq3vvzWSBgemE5ml33CmVjm29n0A5ufdFQjokbO6hnFStPBiupMYUPI5u?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/02KSbAP-haCYKmhNC80i8-3I1favAyY8vRP3kFFpQjbMvsG50aszARQmWznL1NQuqtC0G3uKZh7NK1bx695cDmJ2H91YSL-iNmA5RNGXA16eGMJ4iY7FDWzsZ1TTi4s9ZqBBq4reMsCM8Wlmx209C96DjoQbupjiyCh4O7jXrKxGoAxBjN7_BNVmkeQJDJQG?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/E8VSH3v5-xfpCFBSnlRY_p2Y04pQpqoNNS3sJe6LVFsUT0kavJPBklULarWMTbZeO26zxNCaYmkYvKVnzy2SIN97UPUQ-tA-eXl9lShnKF3-W33lO3nRdB9r81vOfdptmeGSefNNsiLcjGpWvvupj8x_LTg1N-2tMPDMw3ab3cGZQa8ihMNxofgMn_PYz4Dw?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/eQ76EOxDxUsGAQ5oBTieozrzbvYX2lV-czk4Y2hEQC-2JlrGK3mZgFBqTycn9m9sYpX5yMefNYIBXUUcxfab-VLK4mu4zeoOGbiew_0DXvEv8NvISdPt6lA8pMIZFiAqYgW4EJb6PcpHFai-adhl5a33KLWeFvGEL2LTTY1oU5fQTS3Wyoz1z4LKEsb71wr9?purpose=fullsize)

## Purpose:

- Immediate status
- Instant help (craving button)

---

## Layout Structure:

### Top Section:

- Greeting:

  - “Day 5 smoke-free”
- Subtext:

  - “You’re doing great”

---

### Center (Primary Focus):

### 🔘 **Craving Button**

- Large, centered
- Label:

  - “I feel like smoking”

👉 This is the **primary CTA of the entire app**

---

### Below Button:

Quick stats (3 max):

- Money saved
- Cigarettes avoided
- Time smoke-free

---

### Bottom Section:

- Daily check-in card:

  - “How was today?”

---

## Interaction:

- Tap craving button → open **Craving Flow**
- Tap check-in → open modal (not full page)

---

# 3.2 🚨 Craving Flow (Critical UX)

![Image](https://images.openai.com/static-rsc-4/nLix4qBPFk25nEb3o5CFsTChfVpp4JCzFFwsCUpxETmgGd1x2PCNpiLCzvADAhUXVhAm_gO602dTQBC1Nr7eHiS-8JSiZWa24SpjjabZlygp1dpHcysYkspqlMlkOcriO57Lj1ARNEHnAYEj8lXA5C02m2YLIkDpCZUwvt19Ilof1FxsPuXWLMqPcR50ZMA_?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/KGLldrc2gTaVUp6SdvCDjBIBrIYsxSQtPcxVY2lhRXfZj6NTgo25CIvi4rS676S4TcyK-WzsLeC5x6do5-SZ4yFxIsy4jrmpAyeJ_JHV1eT39bGGO4zlun15CDREOfkyJI60wCvjnfTT540a3481AEOp3appmSEHqEdxKFmzehMftAXkRRMmZ-TYCvj5yUTa?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/pKkWUWZ15oYTjxJSum98s8hZ92GzmmBJLlHzI2itwWt0jfVJqr9sP6H7WB0-ix7ZxeuYTTRK_hW6F357cTeVrrjSeZx4ej3ysOE3-7vgUCnWIyFk_5iPcWNn0l0eeVuKJH4l0vfGzFHscg8pm0Rwng7YeQdJ3nWZHzsTbz7ugCtuYHPvFqWJL0SPlGddYo1e?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/LpBLnmS5bQ_U8KRaWnifSxutQpgylf_-O1kqkePxbF99WVhwlioR13Nf9Si-bxReyHfbuD1zBSbhxc04JxvyrPK1ACJAuEGQK582MHBtS7oVhGHiGXYAX-cH5qDVUJckghtNBJib2gVHa9BnO2ESKzkOaXzENON-hDcfmFisIahi_7A_CJZKtmXpB0e1u2wG?purpose=fullsize)

## Trigger:

- From Home button

---

## Step 1: Pause Screen

- Text:

  - “Pause. Breathe.”

- Animated breathing circle:

  - expand/contract (4–4 rhythm)

---

## Step 2: Quick Options

Buttons:

- “Do a 30s reset”
- “Distract me”
- “Remind me why”

---

## Step 3: Reinforcement

Show:

- “You’ve avoided 42 cigarettes”
- “This urge will pass in ~3 minutes”

---

## UX Rules:

- No scrolling
- No clutter
- Max 2–3 actions

---

# 3.3 ✅ Daily Check-in (Modal)

![Image](https://images.openai.com/static-rsc-4/ngKgqhe3bKe-9Z1XFEl_ccqPu5VBwdJaegae0I3dbMpVfHwXdb2d6pBZu6cGEFnP5NfEFhb36ZGsyCYFQDB9m-UVvkWO2xxswGd6qvlXDSeSA2TdmOTkOxLnguV0wrAumNckz7r3GYYZvOh5lIdmJSj-3thHKBuoBBow8oKFtrTaeyp_QsRre-UT0owS8SQh?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/i7eERGlXaeR9FCa1RN_OmKVPyMIix9p8GKtIxl13dEheTU6iYk8l-Rc8DfdwXOMS1v22FlrobTacsZlkATM-M5L3IvjoNRUN75JjCFpShGa3YbyLkAfud3wBfV-SyYO3QFFG7v-hnDnyoIY06as7tG_eNVmSZP11aURMH1TpIfrVfa4-lV2VaISFXWhTNB8O?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/jEspotiVFeJflO2gU9iEXfMR-Icu0_NZBXmaWAmuBwNzka2a0dM9zkQ5MBnmDLNviViBOWVYa8Bbj-9BeAbLxxfoqschvVIbHfuqcrMZoT1KNIMYoGpEgaHi5HhvSt6UG1f5u0hei2ZidotDhE-Ao5AmKe6SLecpFtWXmmawSdLm30N_I9gjRbt3ZxR0VDq4?purpose=fullsize)

## Trigger:

- Home card or notification

---

## Inputs:

1. Did you smoke today?

   - Yes / No (toggle)

2. Craving level:

   - Slider (1–5)

3. Optional note

---

## UX Rules:

- Must take **< 10 seconds**
- One screen only

---

# 3.4 📊 Progress Screen

![Image](https://images.openai.com/static-rsc-4/qkDr9GwhyWM7aZArhN-eKiaDJhloalfT8yidhIb39bkoDiHkI22Mr2lwZbNAtD3sFB6rvF_YlVFq-9w0iJmrWa0JamRRWF5RMnOxcNDF0pY9-k7lei8Otx1US4T_4hDAAm9EX1-iOuSdDu8AcsIBT_6evG1FbvzTXrabt-Aa1b6J8LLQdK-sFcPvjdNU-_jP?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/fD8pXSt97Si8cXE6SfV94C9-a0m6uiAoLUtEXqkn3g6yhXJpsB7UEiE8Tk0_77zey8GA7XgafnTYxA23wW0Cx9_5Obnr7Gd58OXaRHKJYAwJcnUrGKWDQFnTLIZI1zQzIfbM7W_YxZTZMGZkteqgKs6mTgnEinWvdvCSEYxlaacK6RFLrNq73i6V7cYbS-yi?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/u6tG_K5Z7lo07iS6zyq0ESLkpF-aLEW7buOHklQ3ZPg6f2fIEHC2JWwr9CN-reQGrf5XyBG_jLU86kWz_JZ4JKe-P05wXoZaQUKCc3Msy18TxINfomzQ6bs0FRjTtJLtJJWubOR1SFEL3o37cADCat2dB8ltya8HdmdvwzwNtpK_rXb1sbFbpFeaksF9pZtw?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/8iN2O_BHw6RQDcb0LAoDjK_cEN8hz0eIueLmtXBUR_Q2PsxGUM04iHmDKHCRH54nwVABap72as4zoWfMEu2uVPLAmhLhILH9b76Knd3wPnHDNSGJnh-lYfkuE4ikAT1lgQew4hXy0qh90b0PeeRaFIYdtmH5CFtBcgo4tVGpU2bHco716EgEPY13E0cXBPqu?purpose=fullsize)

## Purpose:

- Reinforce progress (dopamine loop)

---

## Sections:

### 1. Key Metrics (Top Cards)

- Days smoke-free
- Money saved
- Cigarettes avoided

---

### 2. Charts:

- Weekly smoking/craving trend
- Streak visualization

---

### 3. Health Milestones:

- “Lungs improving”
- “Circulation better”

---

## UX Rules:

- No overwhelming data
- Focus on **positive progress**

---

# 3.5 📅 Journey Screen

![Image](https://images.openai.com/static-rsc-4/mTKhX18Wi-zNebru98-ghWdEWhW6qfdLBvVHhDVbbZmph-sv7ng-VHQl9xIIRV9KPbwOBJGhRSgkb7Hf2TjR47B6d5kKk8zf46J1auNx9E15oS22luc74NNnFna6SF7jZg35fY-J6XEvxmlnljKq562CT9IClFa4YdS3QD21Rzfp8k6ihbnkbnH5KnEMoKYj?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/EEO7Ea4PhZprIRTUTmtcjkAwb2Ndd3CM7LI9hPCNBFlqw0GreMTJLtQ22GbPRN6ngztwjyLo7R17__FBQW2PMbY3yLlzJhFvyLpNFPybaPmIzPmU9X_tJ1pswMdfsb-VKxisMmdfGsIspYJY-NaUVAATdPEs3700Jua8Q8HbiuVoqsGDJoyVKv85MLTUtp4T?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/H0-a1OgPqnputkgI1AGYfc6P_xmxGzZTXHEXpltV95IK06Dfn7OEaHKl60uzc5lDs5gzUrX-OH0HeYTIKG6hipxZywMHD77hEPIuHzuvEGVE1kBEku-2tc_mzHZC4FTeMeMKYAyPcVRyxKMpczd6lO8Hm6NXClENIhgA0jePf-9EASaiJTk0HDx-iPdw4ouq?purpose=fullsize)

![Image](https://images.openai.com/static-rsc-4/60kM3zQKlDffKJe3GEcw3Uih0c2R5oUoWMXi8uqHMu-5VcGPyqoZiJq6DXHx3XyKtyK5FGuaU2e7DifbbHNJWwRD1nqGSAT6KaMW4MN4e8xbz-jEu-FHmYoyihNstnIhZMDx4d_XlDITqHcP0J5GvgVFqo8olmc86S-CCjqwmHq9AUqkVrZOYYlJSamgAvmf?purpose=fullsize)

## Purpose:

- Show full journey history

---

## Layout:

- Timeline list:

  - Day X → status
  - icons:

    - ✅ clean
    - ⚠️ craving
    - 🔴 smoked

---

## Features:

- Tap day → details
- Scrollable history

---

# 3.6 ⚙️ Settings Screen

(No images needed)

---

## Sections:

- Profile
- Quit plan
- Notifications
- Subscription
- Privacy

---

## UX Rules:

- Keep secondary
- Not feature-heavy

---

# 4. 🎨 Design System (Flutter-ready)

---

## Colors (from brand):

```dart
primary = Color(0xFF0F766E);
success = Color(0xFF22C55E);
warning = Color(0xFFF59E0B);
background = Color(0xFFF3F4F6);
textPrimary = Color(0xFF111827);
```

---

## Components:

### Buttons:

- Rounded (16–24 radius)
- Primary = filled
- Secondary = outlined

---

### Cards:

- Soft shadow
- Padding: 16
- Border radius: 16

---

### Spacing System:

- 8pt grid:

  - 8, 16, 24, 32

---

# 5. 🔔 Notification UX

---

## Types:

### Daily:

- “How was your day?”

### Craving prediction:

- “You usually crave now. Stay aware.”

### Milestone:

- “Day 3 — hardest part almost done.”

---

## Rules:

- Max 2 per day
- Contextual > generic

---

# 6. 🧠 Behavioral UX Mechanics

---

## Dopamine Loop:

- show progress daily
- celebrate small wins

---

## Friction Reduction:

- no login upfront
- fast check-in

---

## Emotional Safety:

- relapse ≠ failure
- no reset shock

---

# 7. 🚀 Onboarding UX

---

## Steps:

1. Cigarettes/day
2. Years smoking
3. Quit method
4. Start date

---

## UX:

- 1 question per screen
- progress indicator
- finish → immediate dashboard

---

# 8. ⚠️ Critical UX Decisions

---

## 1. Craving button must always be visible

This is your **core feature**

---

## 2. No feature overload in MVP

If you add too much: → users quit the app before quitting smoking

---

## 3. Speed > beauty

Especially:

- Home
- Craving flow

---

# 9. 📈 MVP UI Scope

---

## Build first:

- Home
- Craving flow
- Check-in modal
- Basic stats

---

## Delay:

- Advanced charts
- Social sharing
- Gamification

---

# 🔚 Final UX Insight

Your app wins here:

> When the user is about to smoke… and Quitra stops them.

That moment defines everything.
