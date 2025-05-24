# 📄 V1 Climbing App – Model Reference

_Last updated: May 2025_

This document defines the core data models used in the V1 app and how they relate to key features across the MVP screens.

---

## 👤 USER

Represents the climber using the app. Tracks gamification, social connections, and historical XP progress.

### Fields:
- `totalXP: int` – Total XP earned across all time
- `level: int` – Level based on XP thresholds
- `streakCount: int` – Consecutive days/weeks climbing
- `generalGrade: String` – Median skill grade
- `maxGrade: String` – Highest grade topped
- `flashGrade: String` – Highest flash completed
- `activeQuests: List<Quest>` – Currently tracked XP challenges
- `weeklyXP: Map<String, int>` – e.g. `"2025-W20"` → `340`
- `monthlyXP: Map<String, int>` – e.g. `"2025-04"` → `980`

### XP History Notes:
- Store **raw workout data for 1 week**
- Aggregate into **weekly XP** for 1 month
- Aggregate into **monthly XP** for 1 year
- Summarize into **yearly XP** totals after 12 months

### Social:
- `friendIds: List<String>` – User IDs of confirmed friends
- `incomingRequests: List<FriendRequest>` – Pending friend requests

---

## 🧗 CLIMBATTEMPT

Represents a single attempt at a climb — logged independently or as part of a workout session.

### Fields:
- `grade: String` – e.g. `"V4"`
- `styleTags: List<String>` – e.g. `["Slab", "Volume"]`
- `attempts: int` – Number of attempts made
- `result: String` – One of: `"topped"`, `"flash"`, `"inProgress"`
- `thoughts: String?` – Optional notes
- `date: DateTime` – When the climb happened

---

## 🏋️ WORKOUTSESSION

Captures a set of climbs done in one continuous session.

### Fields:
- `startTime: DateTime` – When session began
- `climbAttempts: List<ClimbAttempt>` – Climbs during session
- `duration: Duration` – How long the session lasted
- `sessionXP: int` – XP earned during the session
- `completed: bool` – Whether session was ended/saved

---

## 🎯 QUEST

Tracks XP challenges that the user can complete. Completed quests add XP and may affect streaks or achievements.

### Fields:
- `id: String` – Unique identifier
- `name: String` – Title (e.g. “Climb 5 V5s”)
- `type: String` – `"style"`, `"grade"`, or `"combo"`
- `styleTag: String?` – Required style (optional)
- `grade: String?` – Required grade (optional)
- `target: int` – Number of climbs to complete
- `progress: int` – Number completed so far
- `completed: bool` – Whether the quest is done

### Constraint:
> Every quest must have at least one of:  
> `styleTag`, `grade` — or both. Never neither.

---

## 👥 FRIENDREQUEST

Tracks an incoming friend request from another user.

### Fields:
- `fromUserId: String` – ID of the requesting user
- `fromUsername: String` – Display name
- `requestedAt: DateTime` – Timestamp of request

---

## 🔗 Relationships Summary
AppState
│
├── User
│   ├── List<Quest>
│   ├── Map<String, int> weeklyXP
│   ├── Map<String, int> monthlyXP
│   ├── List<String> friendIds
│   └── List<FriendRequest>
│
├── List<ClimbAttempt> (log history)
│
└── WorkoutSession (nullable)
    └── List<ClimbAttempt>

