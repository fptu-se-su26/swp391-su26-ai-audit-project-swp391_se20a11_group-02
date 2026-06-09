# StudentDashboard Refactoring - Quick Reference Guide

## 📊 Before vs After

### Before (Original)
```
StudentDashboard.tsx ............................ 4,382 lines
├── 50+ state declarations mixed together
├── 20+ useEffect hooks
├── 30+ event handlers
├── Constants embedded in code
└── No reusable patterns
```

### After (Refactored)
```
StudentDashboard.tsx ............................ ~800 lines (core structure)
├── 5 custom hooks (separated by domain)
├── 4 constants files (organized by feature)
├── 1 reusable component
└── Clean, maintainable code
```

## 🔄 State Management Migration

### Before (Mixed in Component)
```typescript
const [playerCourseId, setPlayerCourseId] = useState<number | null>(null);
const [playerCourseTitle, setPlayerCourseTitle] = useState<string>('');
const [playerCourseAuthor, setPlayerCourseAuthor] = useState<string>('');
const [playerCourseProgress, setPlayerCourseProgress] = useState<string>('0%');
const [playerLectureTitle, setPlayerLectureTitle] = useState<string>('');
const [playerVideoThumbnail, setPlayerVideoThumbnail] = useState<string>('');
const [playerVideoUrl, setPlayerVideoUrl] = useState<string>('');
const [playerTheoryContent, setPlayerTheoryContent] = useState<string>('');
const [learningChapters, setLearningChapters] = useState<LearningCurriculumChapterResponse[]>([]);
const [selectedLessonId, setSelectedLessonId] = useState<number | null>(null);
const [isPlayerLoading, setIsPlayerLoading] = useState<boolean>(false);
const [playerActiveTab, setPlayerActiveTab] = useState<'overview' | 'qa' | 'exercises' | 'quiz'>('overview');
const [curriculumSections, setCurriculumSections] = useState<Record<string, boolean>>({...});
// ... more states
```

### After (Organized in Hook)
```typescript
const courseLearning = useCourseLearning();

// Access all states via:
// courseLearning.playerCourseId
// courseLearning.playerCourseTitle
// courseLearning.playerCourseAuthor
// ... etc
```

## 📁 File Created Summary

### Constants (4 files + 1 index)
| File | Purpose | Key Exports |
|------|---------|-------------|
| paymentConstants.ts | Payment options | TX_TYPE_OPTIONS |
| courseData.ts | Course & problem data | initialMyCourses, problemData |
| contestData.ts | Contest data | participatedContests, contestHistoryData |
| exerciseData.ts | Exercise data | initialExercises |

### Hooks (5 files + 1 index)
| File | States | Functions |
|------|--------|-----------|
| useCourseLearning | 13 states | handleCompleteLesson, refreshLearningProgress, getYoutubeEmbedUrl |
| useQuizManagement | 6 states | loadQuizDetail, handleQuizSubmit |
| useWalletTransaction | 14 states | (state management only) |
| useProfileManagement | 13 states | handlePasswordChange, handleAvatarFileChange, handleSendOtp |
| useCourseFilter | 6 states | scrollLeft, scrollRight |

### Components (1 file + 1 index)
| File | Purpose |
|------|---------|
| EmptyState.tsx | Reusable empty state UI component |

## 🎯 Integration Steps

### Option A: Replace Original File
```bash
# 1. Backup original
cp StudentDashboard.tsx StudentDashboard.tsx.backup

# 2. Copy full content from StudentDashboard_Refactored.tsx
# 3. Make sure all imports are correct
# 4. Test the application
```

### Option B: Update Existing File
```typescript
// At the top of StudentDashboard.tsx, add:
import {
  useCourseLearning,
  useQuizManagement,
  useWalletTransaction,
  useProfileManagement,
  useCourseFilter
} from '../hooks/StudentDashboard';

import {
  TX_TYPE_OPTIONS,
  initialMyCourses,
  problemData,
  initialExercises,
  participatedContests,
  contestHistoryData
} from '../constants/StudentDashboard';

import { EmptyState } from '../components/StudentDashboard';

// Then in component:
const courseLearning = useCourseLearning();
const quizManagement = useQuizManagement();
const walletTx = useWalletTransaction();
const profileMgmt = useProfileManagement(user);
const courseFilter = useCourseFilter();

// Replace all state declarations with hook calls
// Replace all constant references with imported constants
```

### Option C: Hybrid Approach
Keep StudentDashboard.tsx as is and import from StudentDashboard_Refactored.tsx

## 📜 Usage Examples

### Accessing Course Learning State
```typescript
// Instead of:
// playerCourseId, setPlayerCourseId, playerCourseTitle...

// Use:
const courseLearning = useCourseLearning();
console.log(courseLearning.playerCourseId);
courseLearning.setPlayerCourseId(123);
```

### Using Quiz Management
```typescript
const quizManagement = useQuizManagement();

// Load quiz
await quizManagement.loadQuizDetail(courseId, lessonId);

// Submit quiz
await quizManagement.handleQuizSubmit(courseId);

// Access states
quizManagement.currentQuiz
quizManagement.selectedAnswers
quizManagement.isQuizSubmitting
```

### Profile Management
```typescript
const profileMgmt = useProfileManagement(user);

// Handle avatar upload
<input onChange={profileMgmt.handleAvatarFileChange} />

// Access password states
profileMgmt.currentPassword
profileMgmt.newPassword

// Access UI state
profileMgmt.passwordStatus
profileMgmt.emailStatus
```

## ✅ Verification Checklist

- [ ] All 5 hooks created in frontend/src/hooks/StudentDashboard/
- [ ] All 4 constants files created in frontend/src/constants/StudentDashboard/
- [ ] EmptyState component created in frontend/src/components/StudentDashboard/
- [ ] All index.ts files created for exports
- [ ] StudentDashboard.tsx updated or StudentDashboard_Refactored.tsx ready to use
- [ ] No TypeScript errors in imports
- [ ] All service imports resolve correctly
- [ ] Application builds without errors
- [ ] Dashboard tab renders correctly
- [ ] Navigation between tabs works
- [ ] Quiz functionality works
- [ ] Profile editing works
- [ ] Payment/deposit works

## 🐛 Troubleshooting

### Issue: "Cannot find module 'useCourseLearning'"
**Solution:** Check that the hooks are in `frontend/src/hooks/StudentDashboard/` directory

### Issue: "TX_TYPE_OPTIONS is not exported"
**Solution:** Check that `frontend/src/constants/StudentDashboard/index.ts` exports all constants

### Issue: Service functions not found
**Solution:** Update import paths in hooks to match your actual service locations:
- Change `../services/courseService` to your actual path

### Issue: EmptyState component not rendering
**Solution:** Ensure StudentDashboard component exists at correct path

## 📞 Common Integration Patterns

### Pattern 1: Using Multiple Hooks
```typescript
export const StudentDashboard: React.FC = () => {
  const courseLearning = useCourseLearning();
  const quizManagement = useQuizManagement();
  const walletTx = useWalletTransaction();
  const profileMgmt = useProfileManagement(user);
  const courseFilter = useCourseFilter();
  
  // All state is now centralized per domain
};
```

### Pattern 2: Accessing Specific States
```typescript
// Course player states
const { playerCourseId, playerCourseTitle, handleCompleteLesson } = useCourseLearning();

// Quiz states
const { currentQuiz, selectedAnswers, loadQuizDetail } = useQuizManagement();
```

### Pattern 3: Updating UI Based on Hook State
```typescript
const courseLearning = useCourseLearning();

return (
  <div>
    <h1>{courseLearning.playerCourseTitle}</h1>
    <button onClick={() => courseLearning.setPlayerCourseId(id)}>
      Load Course
    </button>
  </div>
);
```

## 🎓 Best Practices After Refactoring

1. **Use hooks for state** - Never add state directly to component after this refactoring
2. **Extract more components** - Consider creating tab components
3. **Extract more hooks** - If component logic grows, create new hooks
4. **Type your props** - Create interfaces for component props
5. **Document hooks** - Add JSDoc comments to hooks
6. **Test hooks** - Write unit tests for hooks using @testing-library/react-hooks

## 📚 Additional Resources

- Hook documentation: See REFACTORING_GUIDE.md for detailed hook descriptions
- Original file: StudentDashboard.tsx (backup for reference)
- Refactored file: StudentDashboard_Refactored.tsx (latest version with hooks)

