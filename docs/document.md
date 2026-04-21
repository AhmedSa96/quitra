Below is a **complete product + technical specification document** tailored for
your stack (**Flutter + Isar**) and your goal of building a **high-retention
smoking cessation app**.

---

# 📄 Smoke Quitting App — Product & Technical Specification

---

# 1. 🎯 Product Vision

Build a **behavior-change mobile app** that helps users quit smoking through:

- Habit tracking
- Psychological support
- Real-time intervention
- Progress visualization

This is **not just a tracker**, but a **decision-support system during
cravings**.

---

# 2. 👤 Target Users

### Primary:

- Smokers actively trying to quit

### Secondary:

- Smokers considering quitting
- Users who relapse frequently

---

# 3. 🧱 Core Product Principles

- **Strictly Offline-only**
- **Low friction onboarding**
- **Emotionally supportive UX**
- **Data-driven insights**
- **Complete privacy (No cloud storage)**

---

# 4. 📱 Feature Breakdown

---

## 4.1 Onboarding System

### Goal:

Capture minimal but critical data to personalize the journey.

### Inputs:

- Cigarettes per day
- Years of smoking
- Quit method:

  - Cold turkey
  - Gradual reduction
- Quit start date
- Cigarette price (single or packet pricing)

### Output:

- Personalized plan
- Initial stats baseline

---

## 4.2 Daily Journey System

### Features:

- Daily check-in:

  - “Did you smoke today?”
  - “Cravings level (1–5)”
- Streak tracking
- Timeline history

### Data Stored:

- Daily logs
- Craving intensity
- Relapse flags

---

## 4.3 Craving Intervention System (CORE FEATURE)

### “I feel like smoking” button

Triggers:

- Breathing exercise (30–60 sec)
- Motivational message
- Real-time stats:

  - money saved
  - cigarettes avoided

### Optional:

- distraction task (e.g., “drink water”, “walk 2 min”)

---

## 4.4 Statistics Engine

### Metrics:

- Days smoke-free
- Cigarettes avoided
- Money saved
- Life regained (estimated)
- Health recovery milestones

### Visualization:

- Charts (weekly/monthly)
- Progress bars

---

## 4.5 Smart Notification System

### Types:

- Daily check-in reminder
- Craving-time prediction
- Milestone celebration

### Phase 1:

- Fixed schedule notifications

### Phase 2:

- Behavior-based notifications (AI-lite logic)

---

## 4.6 Relapse Handling System

### Behavior:

- Detect relapse via check-in
- Do NOT reset harshly

### UX:

- Show encouragement
- Maintain partial progress
- Suggest restart or continue

---

## 4.7 Social Sharing

### Output:

- Shareable stat card:

  - “7 days smoke-free”
  - money saved
  - progress bar

### Platform:

- Native share sheet

---

## 4.8 Settings & Data Portability

### Features:

- Language picker (Arabic, English, Turkish)
- Quit Plan (method + start date)
- Cigarette price (single or packet pricing)
- Notification settings
- Privacy Policy
- **CSV Data Export:** Backup all local tracking data to a CSV file.
- **CSV Data Import:** Restore data from a previously exported CSV file.
- Theme switching (Light/Dark/System)

### Note:

- Profile and Subscription features have been removed
- All settings changes are made via dialogs (not pages)

---



---

# 5. 🏗️ System Architecture

---

## 5.1 Frontend (Flutter)

### State Management:

- Bloc (you already use it → good choice)

### Layers:

- Presentation (UI)
- Application (Bloc)
- Domain (business logic)
- Data (repositories)

---

## 5.2 Local Storage (Isar)

### Database:

- Isar (High-performance NoSQL for Flutter)
- Encrypted storage (optional for future)

---

# 6. 🗄️ Database Schema (Isar)

---

## 6.1 Collections

### UserProfile (Collection)
- id (int)
- cigarettes_per_day
- years_smoking
- quit_method
- quit_start_date
- cigarette_price (double)
- packet_price (double)
- cigarettes_per_packet (int)

### DailyLog (Collection)
- id (int)
- date (DateTime)
- smoked (bool)
- cravings_level (int)
- notes (string)

### CravingEvent (Collection)
- id (int)
- timestamp (DateTime)

---

# 7. 🔄 Data Flow

---

### Local-only logic:

1. User interacts with app → data stored locally in Isar.
2. Analytics: None (Privacy-first).
3. Backup: Manual CSV Export/Import.

---

# 8. 🧠 Core Algorithms

---

## 8.1 Money Saved

```
money_saved = cigarettes_avoided × price_per_cigarette
```

---

## 8.2 Cigarettes Avoided

```
cigs_avoided = days_smoke_free × cigarettes_per_day
```

---

## 8.3 Craving Prediction (Phase 2)

Simple heuristic:

- detect peak craving times
- send notification before that time

---

# 9. 🎨 UX Structure (Screens)

---

## Main Screens:

1. **Home Dashboard**

   - streak
   - stats
   - "Craving Button"

2. **Daily Check-in**

   - quick input

3. **Stats Screen**

   - charts
   - milestones

4. **Journey Timeline**

   - history view

5. **Settings**

   - Language picker (opens dialog)
   - Quit Plan (opens dialog)
   - Cigarette Price (opens dialog)
   - Notifications
   - Privacy Policy

---

# 10. 🚀 MVP Scope (what you build FIRST)

---

### Include:

- onboarding
- daily tracking
- streak + stats
- craving button
- basic notifications
- settings (language, quit plan, cigarette price)

### Exclude initially:

- cloud sync
- analytics

---

# 11. 📈 Growth Strategy

---

## Organic Growth:

- social sharing cards
- milestone screenshots

## Retention:

- daily check-ins
- streak system
- emotional reinforcement

---

# 12. ⚠️ Risks & Mitigation

---

### Risk: Low retention

👉 Fix:

- craving button
- notifications

---

### Risk: Users drop after relapse

👉 Fix:

- soft recovery system

---

### Risk: App feels generic

👉 Fix:

- personalized journey
- emotional UX

---

# 13. 🛠️ Tech Stack Summary

---

### Storage:

- Flutter
- Bloc
- Isar (Local database)

### External Services:

- None (100% Offline)

---

# 14. 📅 Suggested Development Plan

---

### Week 1:

- UI design + onboarding

### Week 2:

- daily tracking + stats

### Week 3:

- craving system + notifications

### Week 4:

- polish + testing

---

# 15. 🧠 Final Strategic Insight

Your success depends on this:

> Users don’t quit smoking when they open your app. They quit when they are
> about to smoke.

So optimize for:

- **fast access**
- **instant help**
- **emotional reinforcement**
