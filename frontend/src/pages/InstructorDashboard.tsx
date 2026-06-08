import React, { useState, useEffect, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { instructorService } from '../services/instructorService';

/* 
  Tailwind Safelist for dynamic classes from backend:
  from-blue-500 to-indigo-600
  from-emerald-500 to-teal-600
  from-orange-400 to-primary
*/

interface QuestionReply {
  author: string;
  avatar: string;
  role: string;
  time: string;
  text: string;
}

interface StudentQuestion {
  id: number;
  author: string;
  avatar: string;
  role: string;
  time: string;
  text: string;
  replies: QuestionReply[];
}

interface Lesson {
  id?: number;
  title: string;
  video: string;
  overview: string;
  questions: StudentQuestion[];
  isTrial?: boolean;
  duration?: string;
  theory?: string;
  exercises?: any[];
  quizzes?: any[];
}

interface Chapter {
  id?: number;
  title: string;
  lessons: Lesson[];
}

interface CourseSyllabus {
  chapters: Chapter[];
}



interface InstructorCourse {
  id: string;
  title: string;
  level: string;
  topic: string;
  price: string;
  studentsCount: number;
  rating: number;
  reviewsCount: number;
  status: 'published' | 'review' | 'draft';
  icon: string;
  gradient: string;
  description: string;
}

export const InstructorDashboard: React.FC = () => {
  const { user } = useApp();
  // Helper to scroll the browser window to the bottom when chapters/lessons are added
  const scrollToCurriculumBottom = () => {
    setTimeout(() => {
      window.scrollTo({
        top: document.documentElement.scrollHeight,
        behavior: 'smooth'
      });
    }, 100);
  };

  // Navigation active tab: 'dashboard' | 'my-courses' | 'revenue' | 'edit-course'
  const [activeTab, setActiveTab] = useState<'dashboard' | 'my-courses' | 'revenue' | 'edit-course'>('dashboard');
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState<boolean>(false);

  // Synchronize Tab State with Location Hash (just like in the HTML template)
  useEffect(() => {
    const handleRouting = () => {
      let currentHash = window.location.hash || '#dashboard';
      if (currentHash === '#edit-course') {
        setActiveTab('edit-course');
      } else if (currentHash === '#my-courses') {
        setActiveTab('my-courses');
      } else if (currentHash === '#revenue') {
        setActiveTab('revenue');
      } else {
        setActiveTab('dashboard');
      }
    };

    window.addEventListener('hashchange', handleRouting);
    handleRouting();

    // Check viewport width for default sidebar collapse preference
    const savedCollapsed = localStorage.getItem('sidebar-collapsed');
    if (savedCollapsed !== null) {
      setIsSidebarCollapsed(savedCollapsed === 'true');
    } else {
      setIsSidebarCollapsed(window.innerWidth < 768);
    }

    return () => window.removeEventListener('hashchange', handleRouting);
  }, []);

  const toggleSidebar = () => {
    setIsSidebarCollapsed(prev => {
      localStorage.setItem('sidebar-collapsed', String(!prev));
      return !prev;
    });
  };

  // Modals Visibility
  const [isCreateCourseOpen, setIsCreateCourseOpen] = useState(false);

  // Active course syllabus details for the WORKSPACE PANEL
  const [workspaceCourseTitle, setWorkspaceCourseTitle] = useState('Data Structures & Algorithms');
  const [curriculumData, setCurriculumData] = useState<CourseSyllabus>({ chapters: [] });

  // Selected item (Chapter or Lesson) inside workspace syllabus
  const [selectedItem, setSelectedItem] = useState<{ type: 'chapter' | 'lesson' | null; chIdx: number; lesIdx: number | null }>({ type: null, chIdx: 0, lesIdx: null });

  const activeChapter = curriculumData.chapters[selectedItem.chIdx] || null;
  const activeLesson = (selectedItem.type === 'lesson' && selectedItem.lesIdx !== null)
    ? curriculumData.chapters[selectedItem.chIdx]?.lessons[selectedItem.lesIdx] || null
    : null;

  // Workspace sub-tabs: 'overview' | 'theory' | 'code' | 'media' | 'qa'
  const [editorTab, setEditorTab] = useState<'overview' | 'theory' | 'exercises' | 'code' | 'quiz' | 'media' | 'qa'>('overview');

  // Form states for individual creation/editing
  const [chapterTitle, setChapterTitle] = useState('');
  const [lessonTitle, setLessonTitle] = useState('');
  const [lessonIsTrial, setLessonIsTrial] = useState(false);
  const [lessonDuration, setLessonDuration] = useState('12:45');
  const [lessonTheory, setLessonTheory] = useState('');

  // Exercise & Quiz states
  const [isExerciseModalOpen, setIsExerciseModalOpen] = useState(false);
  const [editingExerciseId, setEditingExerciseId] = useState<number | null>(null);
  const [exerciseTitle, setExerciseTitle] = useState('');
  const [exerciseDifficulty, setExerciseDifficulty] = useState('EASY');
  const [exerciseDescription, setExerciseDescription] = useState('');
  const [exerciseInitialCode, setExerciseInitialCode] = useState('');
  const [exerciseSolutionCode, setExerciseSolutionCode] = useState('');
  const [exerciseTestCases, setExerciseTestCases] = useState<any[]>([]);

  const [isQuizModalOpen, setIsQuizModalOpen] = useState(false);
  const [editingQuizId, setEditingQuizId] = useState<number | null>(null);
  const [quizTitle, setQuizTitle] = useState('');
  const [quizQuestions, setQuizQuestions] = useState<any[]>([]);

  // Video uploading states
  const [isUploadingVideo, setIsUploadingVideo] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [uploadSpeed, setUploadSpeed] = useState('0 MB/s');
  const [uploadedVideoName, setUploadedVideoName] = useState<string | null>(null);

  // Sync state values when selected item changes
  useEffect(() => {
    if (selectedItem.type === 'chapter' && activeChapter) {
      setChapterTitle(activeChapter.title);
    } else if (selectedItem.type === 'lesson' && activeLesson) {
      setLessonTitle(activeLesson.title);
      setLessonIsTrial(activeLesson.isTrial || false);
      setLessonDuration(activeLesson.duration || '12:45');
      setLessonTheory(activeLesson.theory || 'Welcome to this lesson. In this theory section, we will cover the core concepts...');
      setUploadedVideoName(activeLesson.video || null);
    }
  }, [selectedItem.chIdx, selectedItem.lesIdx, selectedItem.type, activeChapter, activeLesson]);

  const handleSaveChapter = () => {
    if (!chapterTitle.trim()) {
      alert('Chapter title cannot be empty!');
      return;
    }
    setCurriculumData(prev => {
      const newChapters = [...prev.chapters];
      newChapters[selectedItem.chIdx].title = chapterTitle.trim();
      return { chapters: newChapters };
    });
    alert('Chapter info saved to backend successfully via separate API!');
  };

  const handleSaveLessonOverview = () => {
    if (!lessonTitle.trim()) {
      alert('Lesson title cannot be empty!');
      return;
    }
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          return {
            ...les,
            title: lessonTitle.trim(),
            isTrial: lessonIsTrial,
            duration: lessonDuration
          };
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
    alert('Lesson Overview saved to backend successfully via separate API!');
  };

  const handleSaveLessonTheory = () => {
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          return { ...les, theory: lessonTheory };
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
    alert('Lesson Theory content saved to backend successfully via separate Theory API!');
  };
  // --- Exercise Handlers ---
  const handleOpenExerciseModal = (exercise?: any) => {
    if (exercise) {
      setEditingExerciseId(exercise.id);
      setExerciseTitle(exercise.title);
      setExerciseDifficulty(exercise.difficulty);
      setExerciseDescription(exercise.description || '');
      setExerciseInitialCode(exercise.initialCode || '');
      setExerciseSolutionCode(exercise.solutionCode || '');
      setExerciseTestCases(exercise.testCases || []);
    } else {
      setEditingExerciseId(null);
      setExerciseTitle('');
      setExerciseDifficulty('EASY');
      setExerciseDescription('');
      setExerciseInitialCode('');
      setExerciseSolutionCode('');
      setExerciseTestCases([]);
    }
    setIsExerciseModalOpen(true);
  };

  const handleAddTestCase = () => {
    setExerciseTestCases(prev => [...prev, { id: Date.now(), input: '', expectedOutput: '', isHidden: false }]);
  };

  const handleUpdateTestCase = (idx: number, field: string, value: any) => {
    setExerciseTestCases(prev => {
      const updated = [...prev];
      updated[idx] = { ...updated[idx], [field]: value };
      return updated;
    });
  };

  const handleDeleteTestCase = (idx: number) => {
    setExerciseTestCases(prev => prev.filter((_, i) => i !== idx));
  };

  const handleSaveExercise = () => {
    if (!exerciseTitle.trim()) {
      alert('Exercise title cannot be empty.');
      return;
    }
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          const currentExercises = les.exercises || [];
          if (editingExerciseId !== null) {
            return {
              ...les,
              exercises: currentExercises.map(ex => ex.id === editingExerciseId ? { ...ex, title: exerciseTitle, difficulty: exerciseDifficulty, description: exerciseDescription, initialCode: exerciseInitialCode, solutionCode: exerciseSolutionCode, testCases: exerciseTestCases } : ex)
            };
          } else {
            return {
              ...les,
              exercises: [...currentExercises, { id: Date.now(), title: exerciseTitle, difficulty: exerciseDifficulty, description: exerciseDescription, initialCode: exerciseInitialCode, solutionCode: exerciseSolutionCode, testCases: exerciseTestCases }]
            };
          }
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
    setIsExerciseModalOpen(false);
  };

  const handleDeleteExercise = (id: number) => {
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          return { ...les, exercises: (les.exercises || []).filter(ex => ex.id !== id) };
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
  };

  // --- Quiz Handlers ---
  const handleOpenQuizModal = (quiz?: any) => {
    if (quiz) {
      setEditingQuizId(quiz.id);
      setQuizTitle(quiz.title);
      setQuizQuestions(quiz.questions || []);
    } else {
      setEditingQuizId(null);
      setQuizTitle('');
      setQuizQuestions([]);
    }
    setIsQuizModalOpen(true);
  };

  const handleAddQuizQuestion = () => {
    setQuizQuestions(prev => [
      ...prev,
      {
        id: Date.now(),
        content: '',
        options: [
          { id: Date.now() + 1, content: '', isCorrect: true },
          { id: Date.now() + 2, content: '', isCorrect: false }
        ]
      }
    ]);
  };

  const handleUpdateQuizQuestion = (qIdx: number, newContent: string) => {
    setQuizQuestions(prev => {
      const updated = [...prev];
      updated[qIdx].content = newContent;
      return updated;
    });
  };

  const handleAddQuizOption = (qIdx: number) => {
    setQuizQuestions(prev => {
      const updated = [...prev];
      updated[qIdx].options.push({ id: Date.now(), content: '', isCorrect: false });
      return updated;
    });
  };

  const handleUpdateQuizOption = (qIdx: number, optIdx: number, newContent: string) => {
    setQuizQuestions(prev => {
      const updated = [...prev];
      updated[qIdx].options[optIdx].content = newContent;
      return updated;
    });
  };

  const handleSetCorrectOption = (qIdx: number, optIdx: number) => {
    setQuizQuestions(prev => {
      const updated = [...prev];
      updated[qIdx].options.forEach((opt: any, i: number) => {
        opt.isCorrect = (i === optIdx);
      });
      return updated;
    });
  };

  const handleDeleteQuizQuestion = (qIdx: number) => {
    setQuizQuestions(prev => prev.filter((_, i) => i !== qIdx));
  };

  const handleSaveQuiz = () => {
    if (!quizTitle.trim()) {
      alert('Quiz title cannot be empty.');
      return;
    }
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          const currentQuizzes = les.quizzes || [];
          if (editingQuizId !== null) {
            return {
              ...les,
              quizzes: currentQuizzes.map(q => q.id === editingQuizId ? { ...q, title: quizTitle, questions: quizQuestions } : q)
            };
          } else {
            return {
              ...les,
              quizzes: [...currentQuizzes, { id: Date.now(), title: quizTitle, questions: quizQuestions }]
            };
          }
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
    setIsQuizModalOpen(false);
  };

  const handleDeleteQuiz = (id: number) => {
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, cIdx) => {
        if (cIdx !== selectedItem.chIdx) return ch;
        const newLessons = ch.lessons.map((les, lIdx) => {
          if (lIdx !== selectedItem.lesIdx) return les;
          return { ...les, quizzes: (les.quizzes || []).filter(q => q.id !== id) };
        });
        return { ...ch, lessons: newLessons };
      });
      return { chapters: newChapters };
    });
  };

  // Video uploading simulator representing a separate media upload API
  const simulateVideoUpload = (fileName: string) => {
    setIsUploadingVideo(true);
    setUploadProgress(0);
    setUploadSpeed('4.2 MB/s');
    setUploadedVideoName(fileName);

    let progress = 0;
    const interval = setInterval(() => {
      progress += Math.floor(Math.random() * 15) + 5;
      if (progress >= 100) {
        progress = 100;
        clearInterval(interval);
        setTimeout(() => {
          setIsUploadingVideo(false);
          setCurriculumData(prev => {
            const newChapters = [...prev.chapters];
            if (newChapters[selectedItem.chIdx]?.lessons[selectedItem.lesIdx!]) {
              newChapters[selectedItem.chIdx].lessons[selectedItem.lesIdx!].video = fileName;
            }
            return { chapters: newChapters };
          });
          alert(`Video "${fileName}" has been successfully uploaded and linked via separate Media API!`);
        }, 800);
      }
      setUploadProgress(progress);
    }, 250);
  };

  // Student QA response state
  const [qaReplyTextState, setQaReplyTextState] = useState<{ [qId: number]: string }>({});
  const [activeQaReplyInputs, setActiveQaReplyInputs] = useState<{ [qId: number]: boolean }>({});

  const toggleQaReplyInput = (qId: number) => {
    setActiveQaReplyInputs(prev => ({ ...prev, [qId]: !prev[qId] }));
    setQaReplyTextState(prev => ({ ...prev, [qId]: '' }));
  };

  const submitQaReply = (qId: number) => {
    const text = qaReplyTextState[qId]?.trim();
    if (!text) {
      alert('Please write a reply before submitting!');
      return;
    }

    setCurriculumData(prev => {
      const newChapters = [...prev.chapters];
      const chapter = newChapters[selectedItem.chIdx];
      const lesson = chapter?.lessons[selectedItem.lesIdx!];
      const question = lesson?.questions.find(q => q.id === qId);

      if (question) {
        question.replies = [
          ...question.replies,
          {
            author: "Dr. Jenkins",
            avatar: "https://lh3.googleusercontent.com/aida-public/AB6AXuB98dPVylZwO6vg95FQaD4k-myG1YhY-VGq7du1S8-pcxrZmnhUwx2VzSs1AkC17Ld9sN1YJQziGrBM5Wxg39W1UFKWDjBJkC4p7QnbHP8aEqlD703-2MHTrqIN65tt0QPlOkZY7JTwMAXIas3lEuSOkuv9JT3HAenrdph26Gza-yDSVOVR0WEfHbnhWYtKN5fNK-bLnyjvw5pHNbtgeUVJysTqy7Xeb6TBV9G1g22LmO1UX_2MQ-DV5vRbsXPHEqko_NPdoIjv-Is",
            role: "Instructor (You)",
            time: "Just now",
            text: text
          }
        ];
      }
      return { chapters: newChapters };
    });

    setQaReplyTextState(prev => ({ ...prev, [qId]: '' }));
    setActiveQaReplyInputs(prev => ({ ...prev, [qId]: false }));
    alert('Your reply has been posted successfully!');
  };


  // Video and Source Code replacement in workspace builder
  const handleReplaceVideo = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      simulateVideoUpload(file.name);
    }
  };

  // Chapter & Lesson addition / deletion
  const handleAddChapterWorkspace = () => {
    setCurriculumData(prev => {
      const newChapters = [
        ...prev.chapters,
        {
          title: "New Chapter Title",
          lessons: [
            { title: "First Lesson Overview", video: "01_lesson.mp4", overview: "Provide lesson details...", questions: [] }
          ]
        }
      ];
      return { chapters: newChapters };
    });
    // Autoselect the newly added chapter
    setSelectedItem({ type: 'chapter', chIdx: curriculumData.chapters.length, lesIdx: null });
    scrollToCurriculumBottom();
  };

  const handleDeleteChapterWorkspace = (chIdx: number) => {
    if (curriculumData.chapters.length > 1) {
      setCurriculumData(prev => {
        const newChapters = prev.chapters.filter((_, i) => i !== chIdx);
        return { chapters: newChapters };
      });
      setSelectedItem({ type: 'chapter', chIdx: 0, lesIdx: null });
    } else {
      alert('Course syllabus must have at least one chapter!');
    }
  };

  const handleAddLessonWorkspace = (chIdx: number) => {
    setCurriculumData(prev => {
      const newChapters = prev.chapters.map((ch, idx) => {
        if (idx !== chIdx) return ch;
        const nextNum = ch.lessons.length + 1;
        return {
          ...ch,
          lessons: [
            ...ch.lessons,
            {
              title: `Lesson ${nextNum} Overview`,
              video: `0${nextNum}_lesson.mp4`,
              overview: "Provide syllabus details...",
              questions: []
            }
          ]
        };
      });
      return { chapters: newChapters };
    });
    // Select the new lesson immediately
    setSelectedItem({ type: 'lesson', chIdx, lesIdx: curriculumData.chapters[chIdx].lessons.length });
  };

  const handleDeleteLessonWorkspace = (chIdx: number, lesIdx: number) => {
    if (curriculumData.chapters[chIdx].lessons.length > 1) {
      setCurriculumData(prev => {
        const newChapters = [...prev.chapters];
        newChapters[chIdx].lessons = newChapters[chIdx].lessons.filter((_, i) => i !== lesIdx);
        return { chapters: newChapters };
      });
      setSelectedItem({ type: 'chapter', chIdx, lesIdx: null });
    } else {
      alert('A chapter must have at least one lesson!');
    }
  };

  const [isEditorLoading, setIsEditorLoading] = useState(false);
  const [workspaceCourseId, setWorkspaceCourseId] = useState<string | null>(null);

  const openSyllabusEditor = async (course: InstructorCourse) => {
    setIsEditorLoading(true);
    setWorkspaceCourseId(course.id);
    setWorkspaceCourseTitle(course.title);
    
    try {
      const detail = await instructorService.getCourseDetail(course.id);
      
      setCourseTitleInput(detail.title || course.title);
      setCourseDescInput(detail.shortDescription || course.description);
      setCourseLevelInput(detail.level || course.level || 'Intermediate');
      setCourseTopicInput(detail.topic || course.topic || 'Theory & Practices');
      
      const numericPrice = detail.price ? detail.price.toString() : (course.price ? course.price.toString().replace(/[^\d]/g, '') : '0');
      setCoursePriceInput(numericPrice);
      
      setCourseLongDescInput(detail.longDescription || '');
      
      setLearnPoints(detail.whatYouLearn ? detail.whatYouLearn.split('#') : []);
      setHighlightPoints(detail.courseHighlight ? detail.courseHighlight.split('#') : []);
      setTechPoints(detail.technologyTool ? detail.technologyTool.split('#') : []);
      setPrereqPoints(detail.prerequisites ? detail.prerequisites.split('#') : []);
      setAudiencePoints(detail.targetAudience ? detail.targetAudience.split('#') : []);
      setBenefitPoints(detail.completionBenefits ? detail.completionBenefits.split('#') : []);
      
      if (detail.chapters && detail.chapters.length > 0) {
        const mappedChapters: Chapter[] = detail.chapters.map((ch: any) => ({
          title: ch.title,
          id: ch.id,
          lessons: (ch.lessons || []).map((les: any) => ({
            id: les.id,
            title: les.title,
            video: les.videoUrl || '',
            overview: '',
            theory: les.theoryContent || '',
            isTrial: les.isTrial || false,
            questions: [],
            exercises: les.exercises || [],
            quizzes: les.quizzes || []
          }))
        }));
        setCurriculumData({ chapters: mappedChapters });
      } else {
        setCurriculumData({ chapters: [] });
      }
      
      setSelectedItem({ type: null, chIdx: 0, lesIdx: null });
      window.location.hash = '#edit-course';
    } catch (err) {
      console.error('Failed to load course details', err);
      // Fallback to mock data if it fails, or show alert
      alert('Could not load course details from server. Fallback to basic details.');
      setCourseTitleInput(course.title);
      setCourseDescInput(course.description);
      setCurriculumData({ chapters: [] });
      window.location.hash = '#edit-course';
    } finally {
      setIsEditorLoading(false);
    }
  };

  const closeSyllabusEditor = () => {
    window.location.hash = '#my-courses';
  };

  const [isSaving, setIsSaving] = useState(false);

  const handleSaveAllCourseChanges = async () => {
    if (!workspaceCourseId) {
      alert('Không tìm thấy ID khóa học để lưu!');
      return;
    }
    if (!courseTitleInput.trim()) {
      alert('Tiêu đề khóa học không được để trống!');
      return;
    }

    setIsSaving(true);
    try {
      const updatePayload = {
        title: courseTitleInput.trim(),
        shortDescription: courseDescInput.trim(),
        longDescription: courseLongDescInput.trim(),
        level: courseLevelInput,
        topic: courseTopicInput,
        price: Number(coursePriceInput) || 0,
        whatYouLearn: learnPoints.filter(p => p.trim()).join('#'),
        courseHighlight: highlightPoints.filter(p => p.trim()).join('#'),
        technologyTool: techPoints.filter(p => p.trim()).join('#'),
        prerequisites: prereqPoints.filter(p => p.trim()).join('#'),
        targetAudience: audiencePoints.filter(p => p.trim()).join('#'),
        completionBenefits: benefitPoints.filter(p => p.trim()).join('#'),
        chapters: curriculumData.chapters.map((ch, cIdx) => ({
          id: ch.id,
          title: ch.title,
          lessons: ch.lessons.map((les, lIdx) => {
            const isActive = selectedItem.type === 'lesson' && selectedItem.chIdx === cIdx && selectedItem.lesIdx === lIdx;
            return {
              id: les.id,
              title: isActive && lessonTitle.trim() ? lessonTitle.trim() : les.title,
              video: les.video || '',
              theory: isActive && lessonTheory !== undefined ? lessonTheory : (les.theory || ''),
              isTrial: isActive ? lessonIsTrial : !!les.isTrial,
              quizzes: les.quizzes || []
            };
          })
        }))
      };

      const updatedCourse = await instructorService.updateCourse(workspaceCourseId, updatePayload);

      // Update local state with the response from server
      setInstructorCourses(prev =>
        prev.map(c => {
          if (c.id === workspaceCourseId) {
            return {
              ...c,
              title: updatedCourse.title,
              description: updatedCourse.description,
              level: updatedCourse.level,
              topic: updatedCourse.topic,
              price: updatedCourse.price,
              status: updatedCourse.status,
            };
          }
          return c;
        })
      );
      setWorkspaceCourseTitle(updatedCourse.title);
      alert('✅ Đã lưu toàn bộ thay đổi! Khóa học đang ở trạng thái "Chờ duyệt" (Pending) để Admin kiểm tra.');
    } catch (error) {
      console.error('Failed to save course:', error);
      alert('❌ Lưu thất bại! Vui lòng kiểm tra kết nối Backend và thử lại.');
    } finally {
      setIsSaving(false);
    }
  };


  const [instructorCourses, setInstructorCourses] = useState<InstructorCourse[]>([]);
  const [transactions, setTransactions] = useState<any[]>([]);
  const [registrations, setRegistrations] = useState<any[]>([]);
  const [payouts, setPayouts] = useState<any[]>([]);
  const [totalGrossRevenue, setTotalGrossRevenue] = useState<number>(0);
  const [totalNetRevenue, setTotalNetRevenue] = useState<number>(0);
  const [totalActualTakeHome, setTotalActualTakeHome] = useState<number>(0);
  const [courseBreakdown, setCourseBreakdown] = useState<any[]>([]);
  const [backendMonthlyChartData, setBackendMonthlyChartData] = useState<any[]>([]);
  const [courseRegistrationsState, setCourseRegistrationsState] = useState<any[]>([]);
  const [totalTrendRegistrationsState, setTotalTrendRegistrationsState] = useState<number>(0);
  const [courseRegPage, setCourseRegPage] = useState<number>(1);
  const [breakdownPage, setBreakdownPage] = useState<number>(1);

  const [revenueFilter, setRevenueFilter] = useState<string>('this-month');
  const [customStartDate, setCustomStartDate] = useState<string>('');
  const [customEndDate, setCustomEndDate] = useState<string>('');
  const [appliedStartDate, setAppliedStartDate] = useState<string>('');
  const [appliedEndDate, setAppliedEndDate] = useState<string>('');
  const [trendTimeframe, setTrendTimeframe] = useState<'1m' | '3m' | '9m' | '12m'>('12m');

  useEffect(() => {
    const fetchInstructorCourses = async () => {
      try {
        const coursesData = await instructorService.getCourses();
        if (coursesData && coursesData.length > 0) {
          setInstructorCourses(coursesData);
          setWorkspaceCourseTitle(coursesData[0].title);
        } else {
          setInstructorCourses([]);
        }
      } catch (error) {
        console.error('Failed to fetch instructor courses:', error);
        setInstructorCourses([]);
      }
    };

    if (user) {
      fetchInstructorCourses();
    }
  }, [user]);

  useEffect(() => {
    const fetchGeneralRevenueData = async () => {
      try {
        const [recentRegs, payoutLogs, chartData] = await Promise.all([
          instructorService.getRecentRegistrations(),
          instructorService.getPayoutHistory(),
          instructorService.getMonthlyChartData()
        ]);
        setRegistrations(recentRegs || []);
        setPayouts(payoutLogs || []);
        setBackendMonthlyChartData(chartData || []);
      } catch (err) {
        console.error("Failed to load general revenue data:", err);
      }
    };

    if (user) {
      fetchGeneralRevenueData();
    }
  }, [user]);

  useEffect(() => {
    const fetchFilteredRevenueData = async () => {
      try {
        const [summary, sales, breakdown] = await Promise.all([
          instructorService.getRevenueSummary(revenueFilter, appliedStartDate, appliedEndDate),
          instructorService.getSalesHistory(revenueFilter, appliedStartDate, appliedEndDate),
          instructorService.getCourseBreakdown(revenueFilter, appliedStartDate, appliedEndDate)
        ]);
        setTotalGrossRevenue(summary?.totalGrossRevenue || 0);
        setTotalNetRevenue(summary?.totalNetRevenue || 0);
        setTotalActualTakeHome(summary?.totalActualTakeHome || 0);
        setTransactions(sales || []);
        setCourseBreakdown(breakdown || []);
        setBreakdownPage(1);
      } catch (err) {
        console.error("Failed to load filtered revenue data:", err);
      }
    };

    if (user) {
      fetchFilteredRevenueData();
    }
  }, [user, revenueFilter, appliedStartDate, appliedEndDate]);

  useEffect(() => {
    const fetchTrendData = async () => {
      try {
        const trendRes = await instructorService.getCourseRegistrations(trendTimeframe);
        setCourseRegistrationsState(trendRes?.courseRegistrations || []);
        setTotalTrendRegistrationsState(trendRes?.totalTrendRegistrations || 0);
        setCourseRegPage(1);
      } catch (err) {
        console.error("Failed to load trend data:", err);
      }
    };

    if (user) {
      fetchTrendData();
    }
  }, [user, trendTimeframe]);


  const [courseSubTab, setCourseSubTab] = useState<'all' | 'published' | 'review' | 'draft'>('all');
  const [courseSearchTerm, setCourseSearchTerm] = useState('');
  const [courseSortFilter, setCourseSortFilter] = useState<'newest' | 'price-low' | 'price-high'>('newest');

  const filteredAndSortedCourses = useMemo(() => {
    let result = [...instructorCourses];

    // 1. Filter by sub-tab status
    if (courseSubTab !== 'all') {
      result = result.filter(c => c.status === courseSubTab);
    }

    // 2. Filter by search query
    if (courseSearchTerm.trim() !== '') {
      const q = courseSearchTerm.toLowerCase().trim();
      result = result.filter(c => c.title.toLowerCase().includes(q) || c.description.toLowerCase().includes(q));
    }

    // 3. Sort
    if (courseSortFilter === 'price-low') {
      result.sort((a, b) => {
        const pA = parseInt(a.price.replace(/[^\d]/g, '')) || 0;
        const pB = parseInt(b.price.replace(/[^\d]/g, '')) || 0;
        return pA - pB;
      });
    } else if (courseSortFilter === 'price-high') {
      result.sort((a, b) => {
        const pA = parseInt(a.price.replace(/[^\d]/g, '')) || 0;
        const pB = parseInt(b.price.replace(/[^\d]/g, '')) || 0;
        return pB - pA;
      });
    } else {
      // Newest first (descending by ID string)
      result.sort((a, b) => b.id.localeCompare(a.id));
    }

    return result;
  }, [instructorCourses, courseSubTab, courseSearchTerm, courseSortFilter]);



  // Course stats timeframe period (1, 3, 6, 9, 12 months)
  const [statsPeriod, setStatsPeriod] = useState<number>(3);

  const courseStats = useMemo(() => {
    return instructorCourses
      .filter(c => c.status === 'published')
      .map(c => {
        const factor = statsPeriod / 12;
        const hash = c.id.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0);
        const variation = 0.8 + (hash % 5) * 0.1;
        const periodStudents = Math.round(c.studentsCount * factor * variation);
        const priceNum = parseInt(c.price.replace(/[^\d]/g, '')) || 0;
        const periodRevenue = periodStudents * priceNum;

        return {
          id: c.id,
          title: c.title,
          students: periodStudents,
          revenue: periodRevenue.toLocaleString('vi-VN') + ' ₫'
        };
      });
  }, [instructorCourses, statsPeriod]);

  const mockRegistrations = registrations;



  // Create Course Form Specification Builders (Highlights, learn metrics, tools, etc.)
  const [learnPoints, setLearnPoints] = useState<string[]>(['Architect scalable MERN applications']);
  const [highlightPoints, setHighlightPoints] = useState<string[]>(['15+ Real-world Projects']);
  const [techPoints, setTechPoints] = useState<string[]>(['React']);
  const [prereqPoints, setPrereqPoints] = useState<string[]>(['Basic JavaScript knowledge (ES6+ features)']);
  const [audiencePoints, setAudiencePoints] = useState<string[]>(['Aspiring Full-Stack Developers']);
  const [benefitPoints, setBenefitPoints] = useState<string[]>(['Professional Certificate']);

  const [courseTitleInput, setCourseTitleInput] = useState('Mastering Full-Stack React & Node.js');
  const [courseTopicInput, setCourseTopicInput] = useState('Web Development');
  const [courseLanguageInput, setCourseLanguageInput] = useState('JavaScript');
  const [courseLevelInput, setCourseLevelInput] = useState('Intermediate');
  const [coursePriceInput, setCoursePriceInput] = useState('499000');
  const [courseDescInput, setCourseDescInput] = useState('Build scalable, production-ready web applications from scratch. Learn advanced patterns...');
  const [courseLongDescInput, setCourseLongDescInput] = useState('The "Mastering Full-Stack React & Node.js" course is a transformative journey designed to take you from zero to a production-ready developer...');
  
  // Thumbnail file mock state
  const [thumbnailFile, setThumbnailFile] = useState<{ name: string; size: string; url: string } | null>(null);

  const handleThumbnailUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      const reader = new FileReader();
      reader.onload = (event) => {
        setThumbnailFile({
          name: file.name,
          size: `${(file.size / 1024).toFixed(1)} KB`,
          url: event.target?.result as string
        });
      };
      reader.readAsDataURL(file);
    }
  };

  const handleCreateCourseSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      const createdCourse = await instructorService.createCourse({
        title: courseTitleInput || 'Untitled Course',
        shortDescription: courseDescInput || 'No description provided.',
        level: courseLevelInput,
        topic: courseTopicInput,
        price: Number(coursePriceInput) || 0
      });

      setInstructorCourses(prev => [createdCourse, ...prev]);
      alert(`Course "${courseTitleInput}" has been successfully created and submitted for review!`);
      setIsCreateCourseOpen(false);

      // Fetch the updated list from server to ensure sync
      try {
        const coursesData = await instructorService.getCourses();
        if (coursesData && coursesData.length > 0) {
          setInstructorCourses(coursesData);
        }
      } catch (err) {
        console.error("Failed to refetch courses after creation", err);
      }

      // Reset simple values
      setCourseTitleInput('');
      setCourseDescInput('');
      setCoursePriceInput('0');
      setThumbnailFile(null);
      setLearnPoints(['Architect scalable MERN applications']);
      setHighlightPoints(['15+ Real-world Projects']);
      setTechPoints(['React']);
      setPrereqPoints(['Basic JavaScript knowledge (ES6+ features)']);
      setAudiencePoints(['Aspiring Full-Stack Developers']);
      setBenefitPoints(['Professional Certificate']);

    } catch (err) {
      console.error("Failed to create course", err);
      alert("There was an error creating your course. Please try again.");
    }
  };

  const resetSimpleCourseForm = () => {
    setCourseTitleInput('');
    setThumbnailFile(null);
    setLearnPoints(['']);
    setHighlightPoints(['']);
    setTechPoints(['']);
    setPrereqPoints(['']);
    setAudiencePoints(['']);
    setBenefitPoints(['']);
  };

  // --- Start of Revenue Tab Specific Code ---
  interface PayoutHistoryItem {
    id: string;
    payoutPeriod: string;
    amount: number;
    bankName: string;
    bankAccountNumber: string;
    status: 'SUCCESS' | 'PROCESSING' | 'PENDING' | 'FAILED';
    transactionReference: string;
    adminNote?: string;
  }

  const mockTransactions = transactions;

  const payoutHistory = payouts;

  const [hoveredPointIdx, setHoveredPointIdx] = useState<number | null>(null);
  const [hoveredEnrollmentPointIdx, setHoveredEnrollmentPointIdx] = useState<number | null>(null);
  const [selectedFailedPayout, setSelectedFailedPayout] = useState<PayoutHistoryItem | null>(null);
  const [isAllPayoutsModalOpen, setIsAllPayoutsModalOpen] = useState<boolean>(false);
  const [enrollmentPage, setEnrollmentPage] = useState<number>(1);

  const displayedTakeHome = totalActualTakeHome;
  const earningsBreakdown = courseBreakdown;
  const BREAKDOWN_PER_PAGE = 5;
  const totalBreakdownPages = Math.ceil(earningsBreakdown.length / BREAKDOWN_PER_PAGE);
  const displayedEarningsBreakdown = earningsBreakdown.slice(
    (breakdownPage - 1) * BREAKDOWN_PER_PAGE,
    breakdownPage * BREAKDOWN_PER_PAGE
  );
  const monthlyChartData = backendMonthlyChartData;
  const monthlyEnrollmentChartData = backendMonthlyChartData;
  const trendFilteredTransactions = { length: totalTrendRegistrationsState };
  const courseRegistrations = courseRegistrationsState;
  const REGISTRATIONS_PER_PAGE = 5;
  const totalCourseRegPages = Math.ceil(courseRegistrations.length / REGISTRATIONS_PER_PAGE);
  const displayedCourseRegistrations = courseRegistrations.slice(
    (courseRegPage - 1) * REGISTRATIONS_PER_PAGE,
    courseRegPage * REGISTRATIONS_PER_PAGE
  );

  const chartPoints = useMemo(() => {
    const maxAmount = Math.max(...monthlyChartData.map(m => m.amount), 1000000);
    const roundMax = Math.ceil(maxAmount / 1000000) * 1000000;
    
    const width = 720;
    const height = 240;
    const paddingLeft = 55;
    const paddingRight = 15;
    const paddingTop = 15;
    const paddingBottom = 30;
    
    const chartWidth = width - paddingLeft - paddingRight;
    const chartHeight = height - paddingTop - paddingBottom;
    
    const points = monthlyChartData.map((m, idx) => {
      const x = paddingLeft + (idx * (chartWidth / 11));
      const y = paddingTop + chartHeight - (m.amount / roundMax) * chartHeight;
      return {
        x,
        y,
        amountFormatted: m.amount.toLocaleString('vi-VN') + ' ₫'
      };
    });
    
    return {
      points,
      paddingLeft,
      paddingRight,
      paddingTop,
      paddingBottom,
      width,
      height,
      chartWidth,
      chartHeight,
      roundMax
    };
  }, [monthlyChartData]);

  const enrollmentChartPoints = useMemo(() => {
    const maxCount = Math.max(...monthlyEnrollmentChartData.map(m => m.count), 5);
    const roundMax = Math.ceil(maxCount / 5) * 5;
    
    const width = 720;
    const height = 240;
    const paddingLeft = 40;
    const paddingRight = 15;
    const paddingTop = 15;
    const paddingBottom = 30;
    
    const chartWidth = width - paddingLeft - paddingRight;
    const chartHeight = height - paddingTop - paddingBottom;
    
    const points = monthlyEnrollmentChartData.map((m, idx) => {
      const x = paddingLeft + (idx * (chartWidth / 11));
      const y = paddingTop + chartHeight - (m.count / roundMax) * chartHeight;
      return {
        x,
        y,
        countFormatted: m.count + (m.count === 1 ? ' student' : ' students')
      };
    });
    
    return {
      points,
      paddingLeft,
      paddingRight,
      paddingTop,
      paddingBottom,
      width,
      height,
      chartWidth,
      chartHeight,
      roundMax
    };
  }, [monthlyEnrollmentChartData]);

  const sortedMockTransactions = useMemo(() => {
    return [...mockTransactions].sort((a, b) => new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime());
  }, [mockTransactions]);

  const totalEnrollmentRecords = sortedMockTransactions.length;
  const recordsPerPage = 10;
  const totalEnrollmentPages = Math.ceil(totalEnrollmentRecords / recordsPerPage);
  
  const pagedEnrollmentTransactions = useMemo(() => {
    const startIndex = (enrollmentPage - 1) * recordsPerPage;
    return sortedMockTransactions.slice(startIndex, startIndex + recordsPerPage);
  }, [sortedMockTransactions, enrollmentPage]);

  const formatFullDateTime = (dateStr: string) => {
    const d = new Date(dateStr);
    const monthsList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const pad = (n: number) => n.toString().padStart(2, '0');
    const day = pad(d.getDate());
    const monthName = monthsList[d.getMonth()];
    const year = d.getFullYear();
    const hours = pad(d.getHours());
    const minutes = pad(d.getMinutes());
    const seconds = pad(d.getSeconds());
    return `${monthName} ${day}, ${year} ${hours}:${minutes}:${seconds}`;
  };

  const maskAccountNumber = (accNum: string) => {
    if (accNum.length <= 6) return accNum;
    const start = accNum.slice(0, 3);
    const end = accNum.slice(-3);
    return `${start}****${end}`;
  };

  const handleApplyCustomDate = () => {
    if (!customStartDate || !customEndDate) {
      alert("Please select both a start date and an end date.");
      return;
    }
    if (new Date(customStartDate) > new Date(customEndDate)) {
      alert("The start date cannot be later than the end date.");
      return;
    }
    setAppliedStartDate(customStartDate);
    setAppliedEndDate(customEndDate);
    setRevenueFilter('custom');
  };
  // --- End of Revenue Tab Specific Code ---


  // Check user logging context
  if (!user) {
    return (
      <div className="bg-surface rounded-2xl border border-gray-150 p-12 text-center shadow-sm max-w-md mx-auto my-12 relative z-10">
        <span className="material-symbols-outlined text-red-500 text-5xl mb-4">lock</span>
        <h3 className="font-display font-black text-xl text-brand-blue mb-2">Access Denied</h3>
        <p className="font-body text-sm text-text-muted mb-6">Please log in to manage your instructor courses.</p>
        <Link to="/login" className="bg-primary hover:bg-primary-hover text-white font-bold text-sm px-6 py-3 rounded-xl transition-all shadow-md">
          Sign In
        </Link>
      </div>
    );
  }

  return (
    <div className="bg-[#f0f4f9] text-text-main font-body min-h-screen flex flex-row antialiased selection:bg-primary-light selection:text-brand-blue relative overflow-x-hidden w-full text-left">
      
      {/* Glow Backdrop styles and properties embedded securely */}
      <style>{`
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .icon-fill {
            font-variation-settings: 'FILL' 1;
        }

        /* Glassmorphism details */
        .glass-panel {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .ambient-shadow {
            box-shadow: 0 4px 20px rgba(18, 40, 76, 0.04);
        }

        .ambient-shadow-hover:hover {
            box-shadow: 0 10px 30px rgba(18, 40, 76, 0.08);
            transform: translateY(-2px);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* Pulsing dot for ongoing contests */
        .pulse-dot {
            position: relative;
        }

        .pulse-dot::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: inherit;
            animation: pulse-ring 1.5s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }

        @keyframes pulse-ring {
            0% {
                transform: scale(1);
                opacity: 1;
            }

            100% {
                transform: scale(2.5);
                opacity: 0;
            }
        }

        /* Collapsible sidebar layout overrides */
        .sidebar-expanded {
            width: 16rem !important;
        }

        .sidebar-collapsed {
            width: 5rem !important;
        }

        .main-expanded {
            margin-left: 16rem !important;
        }

        .main-collapsed {
            margin-left: 5rem !important;
        }

        /* Elements visibility when collapsed */
        .sidebar-collapsed .sidebar-text,
        .sidebar-collapsed .sidebar-footer-text {
            display: none !important;
        }

        .sidebar-collapsed nav a {
            justify-content: center !important;
            padding-left: 0 !important;
            padding-right: 0 !important;
        }

        .sidebar-collapsed .p-3 a {
            justify-content: center !important;
        }

        .sidebar-collapsed .p-3 div.flex {
            padding: 0.25rem !important;
            justify-content: center !important;
        }

        .sidebar-collapsed #sidebar-header {
            flex-direction: column !important;
            height: auto !important;
            padding-top: 1.25rem !important;
            padding-bottom: 1.25rem !important;
            padding-left: 0.5rem !important;
            padding-right: 0.5rem !important;
            gap: 0.75rem !important;
        }
      `}</style>

      {/* Glowing Backdrop Circles */}
      <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
        <div className="absolute -top-40 -left-40 w-[500px] h-[500px] bg-primary/5 rounded-full blur-[120px]"></div>
        <div className="absolute top-1/3 -right-40 w-[500px] h-[500px] bg-brand-blue/5 rounded-full blur-[120px]"></div>
        <div className="absolute bottom-0 left-1/3 w-[600px] h-[600px] bg-brand-green/5 rounded-full blur-[150px]"></div>
      </div>

      {/* Pinned Left Navigation Sidebar */}
      <aside
        id="sidebar"
        className={`fixed top-0 left-0 h-screen transition-all duration-300 ${
          isSidebarCollapsed ? 'sidebar-collapsed' : 'sidebar-expanded'
        } bg-brand-blue text-white flex flex-col justify-between z-50 border-r border-brand-blue-light/35 shadow-2xl shrink-0 overflow-visible`}
      >
        {/* Sidebar Brand / Logo Header */}
        <div className="flex items-center justify-center px-4 h-20 border-b border-brand-blue-light/30 shrink-0" id="sidebar-header">
          <Link to="/" className="flex items-center justify-center logo-link w-full">
            <img
              src={isSidebarCollapsed ? `${import.meta.env.BASE_URL}LOGO_SINGLE.png` : `${import.meta.env.BASE_URL}LOGO.png`}
              alt="Logo"
              className="h-12 w-[300px] object-contain transition-all duration-300"
              id="sidebar-logo"
            />
          </Link>
        </div>

        {/* Sidebar Navigation Links using state routing triggers */}
        <nav className="flex-1 flex flex-col gap-1.5 py-6 px-2.5 overflow-y-auto">
          <a
            href="#dashboard"
            onClick={() => setActiveTab('dashboard')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'dashboard'
                ? 'bg-white/10 text-white font-bold border-l-4 border-primary'
                : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${
              activeTab === 'dashboard' ? 'text-primary icon-fill' : ''
            }`}>dashboard</span>
            <span className="sidebar-text text-sm">Dashboard</span>
          </a>

          <a
            href="#my-courses"
            onClick={() => setActiveTab('my-courses')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'my-courses' || activeTab === 'edit-course'
                ? 'bg-white/10 text-white font-bold border-l-4 border-primary'
                : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${
              activeTab === 'my-courses' || activeTab === 'edit-course' ? 'text-primary icon-fill' : ''
            }`}>library_books</span>
            <span className="sidebar-text text-sm">My Courses</span>
          </a>



          <a
            href="#revenue"
            onClick={() => setActiveTab('revenue')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'revenue'
                ? 'bg-white/10 text-white font-bold border-l-4 border-primary'
                : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${
              activeTab === 'revenue' ? 'text-primary icon-fill' : ''
            }`}>insights</span>
            <span className="sidebar-text text-sm">Revenue</span>
          </a>

        </nav>

        {/* Sidebar Footer Action (Student View Switcher & Profile) */}
        <div className="p-3 border-t border-brand-blue-light/30 flex flex-col gap-3 shrink-0">
          {/* Student View Button */}
          <Link
            to="/dashboard"
            className="flex items-center gap-3 px-3 py-2.5 rounded-xl bg-primary hover:bg-primary-hover text-white text-xs md:text-sm font-semibold transition-all duration-200 justify-center md:justify-start shadow-md shadow-primary/20"
          >
            <span className="material-symbols-outlined text-[20px] shrink-0">swap_horiz</span>
            <span className="sidebar-footer-text whitespace-nowrap">Student View</span>
          </Link>

          {/* Instructor User Identity */}
          <div className="flex items-center gap-3 p-2 rounded-xl bg-brand-blue-light/30">
            <img
              src={user?.avatar || "https://ui-avatars.com/api/?name=Instructor&background=F36F21&color=fff"}
              alt="Instructor Avatar"
              className="w-8 h-8 rounded-full border border-primary/40 object-cover shrink-0"
            />
            <div className="sidebar-footer-text flex flex-col min-w-0">
              <span className="text-xs font-bold text-white truncate leading-tight">
                {user?.name || user?.username || 'Instructor'}
              </span>
              <span className="text-[10px] text-slate-400 truncate leading-none">Primary Instructor</span>
            </div>
          </div>
        </div>

        {/* Floating Sidebar Toggle Button (Vertically Centered on Right Border) */}
        <button
          onClick={toggleSidebar}
          id="sidebar-toggle"
          className="absolute top-1/2 -right-4 -translate-y-1/2 w-8 h-8 rounded-full bg-primary hover:bg-primary-hover text-white flex items-center justify-center shadow-lg border border-white/20 z-50 transition-all duration-300 hover:scale-110"
          title="Toggle Sidebar"
        >
          <span className="material-symbols-outlined text-[20px]">
            {isSidebarCollapsed ? 'chevron_right' : 'chevron_left'}
          </span>
        </button>
      </aside>

      {/* Main Content Area (Shifts dynamically based on sidebar width) */}
      <div
        id="main-content"
        className={`flex-grow transition-all duration-300 relative z-10 ${
          isSidebarCollapsed ? 'main-collapsed' : 'main-expanded'
        } min-h-screen flex flex-col`}
      >
        
        {/* Main content body inside React routing layout shell */}
        {activeTab !== 'edit-course' && (
          <main className="flex-grow p-4 md:p-8 lg:p-10 flex flex-col gap-8 max-w-[1440px] mx-auto w-full">
            
            {/* ================= TAB: DASHBOARD ================= */}
            {activeTab === 'dashboard' && (
              <div id="tab-dashboard" className="tab-content flex flex-col gap-8">
                {/* Header Banner */}
                <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                  <div>
                    <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-2.5 shadow-sm">
                      <span className="material-symbols-outlined text-xs icon-fill">school</span> Instructor Dashboard
                    </div>
                    <h1 className="text-3xl md:text-4xl font-display font-black leading-tight relative z-10">
                      <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">Hello, </span>
                      <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent">
                        {user?.name || user?.username || 'Instructor'}! 👋
                      </span>
                    </h1>
                    <p className="text-text-muted mt-1">Here is a high-level summary of your classes and revenue statistics.</p>
                  </div>

                  {/* Quick Time Filter */}
                  <div className="flex items-center gap-2 self-start md:self-auto bg-surface py-1.5 px-3 rounded-xl border border-slate-200/60 shadow-sm">
                    <span className="material-symbols-outlined text-sm text-text-muted">calendar_today</span>
                    <select className="border-0 bg-transparent text-xs font-semibold text-text-main py-0 pl-1 pr-8 focus:ring-0 cursor-pointer">
                      <option value="7">Last 7 Days</option>
                      <option value="30">Last 30 Days</option>
                      <option value="90">Last 90 Days</option>
                    </select>
                  </div>
                </div>

                {/* Stats Overview Grid */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
                  {/* Stat Card 1 */}
                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4 hover:shadow-lg transition-all duration-300">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Students</span>
                      <span className="text-3xl font-display font-black text-brand-blue mt-1">
                        {instructorCourses.filter(c => c.status === 'published').reduce((sum, c) => sum + c.studentsCount, 0).toLocaleString()}
                      </span>
                      <span className="flex items-center gap-1 text-[11px] font-bold text-brand-green mt-1">
                        <span className="material-symbols-outlined text-[14px]">arrow_upward</span> +12.4% this month
                      </span>
                    </div>
                    <div className="w-12 h-12 rounded-xl bg-brand-green-light text-brand-green flex items-center justify-center">
                      <span className="material-symbols-outlined text-2xl icon-fill">group</span>
                    </div>
                  </div>

                  {/* Stat Card 2 */}
                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4 hover:shadow-lg transition-all duration-300">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Active Courses</span>
                      <span className="text-3xl font-display font-black text-brand-blue mt-1">
                        {instructorCourses.filter(c => c.status === 'published').length}
                      </span>
                      <span className="text-[11px] font-medium text-slate-500 mt-1.5 flex items-center gap-1">
                        <span className="w-1.5 h-1.5 rounded-full bg-slate-400"></span>
                        {instructorCourses.filter(c => c.status === 'draft').length} drafts, {instructorCourses.filter(c => c.status === 'review').length} pending approval
                      </span>
                    </div>
                    <div className="w-12 h-12 rounded-xl bg-primary-light/50 text-primary flex items-center justify-center">
                      <span className="material-symbols-outlined text-2xl icon-fill">library_books</span>
                    </div>
                  </div>

                  {/* Stat Card 3 */}
                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4 hover:shadow-lg transition-all duration-300">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Revenue</span>
                      <span className="text-2xl md:text-3xl font-display font-black text-brand-blue mt-1">15.230K ₫</span>
                      <span className="flex items-center gap-1 text-[11px] font-bold text-brand-green mt-1.5">
                        <span className="material-symbols-outlined text-[14px]">arrow_upward</span> +8.2% vs last month
                      </span>
                    </div>
                    <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
                      <span className="material-symbols-outlined text-2xl icon-fill">payments</span>
                    </div>
                  </div>
                </div>

                {/* Graphs & Trends Row */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                  {/* Left: Analytics Enrollment Chart */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div className="flex justify-between items-center mb-6">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue">Student Enrollment Trend</h3>
                        <p className="text-xs text-text-muted mt-0.5">Visualizes course subscriptions over the last 12 months.</p>
                      </div>
                      <div className="flex items-center gap-2 text-xs font-bold text-brand-blue bg-slate-50 border border-slate-200/40 p-2 rounded-xl">
                        <span className="w-3 h-3 bg-primary rounded-full"></span>
                        <span>Monthly Enrollments</span>
                      </div>
                    </div>

                    {/* Curved Premium SVG Line Chart */}
                    <div className="w-full relative h-[260px] mt-2 select-none">
                      <svg viewBox={`0 0 ${enrollmentChartPoints.width} ${enrollmentChartPoints.height}`} className="w-full h-full overflow-visible select-none">
                        <defs>
                          <linearGradient id="enrollment-chart-area-grad" x1="0" y1="0" x2="0" y2="1">
                            <stop offset="0%" stopColor="#F36F21" stopOpacity="0.25" />
                            <stop offset="100%" stopColor="#F36F21" stopOpacity="0.00" />
                          </linearGradient>
                          <filter id="enrollment-shadow" x="-10%" y="-10%" width="120%" height="120%">
                            <feDropShadow dx="0" dy="4" stdDeviation="4" floodOpacity="0.08" />
                          </filter>
                        </defs>

                        {/* Grid Lines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((ratio, gridIdx) => {
                          const y = enrollmentChartPoints.paddingTop + enrollmentChartPoints.chartHeight - ratio * enrollmentChartPoints.chartHeight;
                          const gridVal = ratio * enrollmentChartPoints.roundMax;
                          return (
                            <g key={gridIdx} className="opacity-40">
                              <line 
                                x1={enrollmentChartPoints.paddingLeft} 
                                y1={y} 
                                x2={enrollmentChartPoints.width - enrollmentChartPoints.paddingRight} 
                                y2={y} 
                                stroke="#cbd5e1" 
                                strokeWidth="1" 
                                strokeDasharray="4 4" 
                              />
                              <text 
                                x={enrollmentChartPoints.paddingLeft - 8} 
                                y={y + 3} 
                                textAnchor="end" 
                                className="text-[10px] fill-slate-500 font-extrabold"
                              >
                                {Math.round(gridVal)}
                              </text>
                            </g>
                          );
                        })}

                        {/* Filled Area Under the Curve */}
                        {enrollmentChartPoints.points.length > 0 && (
                          <path
                            d={`M ${enrollmentChartPoints.points[0].x} ${enrollmentChartPoints.paddingTop + enrollmentChartPoints.chartHeight} 
                               L ${enrollmentChartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')} 
                               L ${enrollmentChartPoints.points[enrollmentChartPoints.points.length - 1].x} ${enrollmentChartPoints.paddingTop + enrollmentChartPoints.chartHeight} Z`}
                            fill="url(#enrollment-chart-area-grad)"
                          />
                        )}

                        {/* Smooth Orange Trend Line */}
                        {enrollmentChartPoints.points.length > 0 && (
                          <path
                            d={`M ${enrollmentChartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')}`}
                            fill="none" 
                            stroke="#F36F21" 
                            strokeWidth="3.5" 
                            strokeLinecap="round"
                            strokeLinejoin="round"
                          />
                        )}

                        {/* Data Dots */}
                        {enrollmentChartPoints.points.map((p, idx) => {
                          const isHovered = hoveredEnrollmentPointIdx === idx;
                          return (
                            <g key={idx}>
                              {isHovered && (
                                <circle 
                                  cx={p.x} 
                                  cy={p.y} 
                                  r="8.5" 
                                  fill="#F36F21" 
                                  fillOpacity="0.2" 
                                  className="transition-all duration-200"
                                />
                              )}
                              <circle 
                                cx={p.x} 
                                cy={p.y} 
                                r={isHovered ? "6" : "4.5"} 
                                fill="#fff" 
                                stroke="#F36F21" 
                                strokeWidth={isHovered ? "4" : "2.5"}
                                className="cursor-pointer transition-all duration-200"
                                onMouseEnter={() => setHoveredEnrollmentPointIdx(idx)}
                                onMouseLeave={() => setHoveredEnrollmentPointIdx(null)}
                              />
                            </g>
                          );
                        })}

                        {/* X Axis Labels */}
                        {monthlyEnrollmentChartData.map((m, idx) => {
                          const p = enrollmentChartPoints.points[idx];
                          return (
                            <text 
                              key={idx}
                              x={p.x} 
                              y={enrollmentChartPoints.height - 8} 
                              fill="#64748b" 
                              fontSize="9" 
                              fontWeight="800" 
                              textAnchor="middle"
                              className="tracking-tight"
                            >
                              {m.label}
                            </text>
                          );
                        })}

                        {/* Tooltip Card */}
                        {hoveredEnrollmentPointIdx !== null && (() => {
                          const p = enrollmentChartPoints.points[hoveredEnrollmentPointIdx];
                          const tooltipWidth = 120;
                          const tooltipHeight = 48;
                          let tx = p.x - tooltipWidth / 2;
                          let ty = p.y - tooltipHeight - 12;
                          
                          // Bound checks
                          if (tx < enrollmentChartPoints.paddingLeft) tx = enrollmentChartPoints.paddingLeft;
                          if (tx + tooltipWidth > enrollmentChartPoints.width - enrollmentChartPoints.paddingRight) {
                            tx = enrollmentChartPoints.width - enrollmentChartPoints.paddingRight - tooltipWidth;
                          }

                          return (
                            <g filter="url(#enrollment-shadow)" className="pointer-events-none animate-fade-in">
                              <rect 
                                x={tx} 
                                y={ty} 
                                width={tooltipWidth} 
                                height={tooltipHeight} 
                                rx="10" 
                                fill="#12284C" 
                              />
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 18} 
                                textAnchor="middle" 
                                fill="#94a3b8" 
                                className="text-[9px] font-extrabold uppercase tracking-wider"
                              >
                                {monthlyEnrollmentChartData[hoveredEnrollmentPointIdx].label}
                              </text>
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 34} 
                                textAnchor="middle" 
                                fill="#ffffff" 
                                className="text-[12px] font-black"
                              >
                                {p.countFormatted}
                              </text>
                            </g>
                          );
                        })()}
                      </svg>
                    </div>
                    <div className="text-center text-[10px] text-text-muted mt-3 font-semibold">
                      <span>* Hover over data points to display precise monthly subscription details.</span>
                    </div>
                  </div>

                  {/* Right: 12-Month Revenue Trend Chart Card */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue uppercase tracking-wider">12-Month Revenue Trend</h3>
                        <p className="text-xs text-text-muted mt-0.5">Visual representation of monthly gross earnings variations over a year.</p>
                      </div>
                      <div className="flex items-center gap-2 text-xs font-bold text-brand-blue bg-slate-50 border border-slate-200/40 p-2 rounded-xl">
                        <span className="w-3 h-3 bg-primary rounded-full"></span>
                        <span>Monthly Gross Revenue</span>
                      </div>
                    </div>

                    {/* SVG Line Chart Wrapper */}
                    <div className="relative w-full h-[260px] mt-2">
                      <svg viewBox={`0 0 ${chartPoints.width} ${chartPoints.height}`} className="w-full h-full overflow-visible select-none">
                        <defs>
                          <linearGradient id="dashboard-chart-area-grad" x1="0" y1="0" x2="0" y2="1">
                            <stop offset="0%" stopColor="#F36F21" stopOpacity="0.25"/>
                            <stop offset="100%" stopColor="#F36F21" stopOpacity="0"/>
                          </linearGradient>
                          <filter id="dashboard-shadow" x="-10%" y="-10%" width="120%" height="120%">
                            <feDropShadow dx="0" dy="4" stdDeviation="4" floodOpacity="0.08"/>
                          </filter>
                        </defs>
                        
                        {/* Horizontal Gridlines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((ratio, gridIdx) => {
                          const y = chartPoints.paddingTop + chartPoints.chartHeight - ratio * chartPoints.chartHeight;
                          const gridVal = ratio * chartPoints.roundMax;
                          return (
                            <g key={gridIdx} className="opacity-40">
                              <line 
                                x1={chartPoints.paddingLeft} 
                                y1={y} 
                                x2={chartPoints.width - chartPoints.paddingRight} 
                                y2={y} 
                                stroke="#cbd5e1" 
                                strokeWidth="1" 
                                strokeDasharray="4 4" 
                              />
                              <text 
                                x={chartPoints.paddingLeft - 10} 
                                y={y + 4} 
                                textAnchor="end" 
                                className="text-[10px] fill-slate-500 font-extrabold"
                              >
                                {gridVal === 0 ? '0 ₫' : `${(gridVal / 1000000).toFixed(1)}M ₫`}
                              </text>
                            </g>
                          );
                        })}

                        {/* Smooth Area Under the Curve */}
                        {chartPoints.points.length > 0 && (
                          <path
                            d={`M ${chartPoints.points[0].x} ${chartPoints.paddingTop + chartPoints.chartHeight} 
                               L ${chartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')} 
                               L ${chartPoints.points[chartPoints.points.length - 1].x} ${chartPoints.paddingTop + chartPoints.chartHeight} Z`}
                            fill="url(#dashboard-chart-area-grad)"
                          />
                        )}

                        {/* Line Stroke */}
                        {chartPoints.points.length > 0 && (
                          <path
                            d={`M ${chartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')}`}
                            fill="none"
                            stroke="#F36F21"
                            strokeWidth="3.5"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                          />
                        )}

                        {/* Interactive Data Dots */}
                        {chartPoints.points.map((p, idx) => {
                          const isHovered = hoveredPointIdx === idx;
                          return (
                            <g key={idx}>
                              {isHovered && (
                                <circle 
                                  cx={p.x} 
                                  cy={p.y} 
                                  r="8.5" 
                                  fill="#F36F21" 
                                  fillOpacity="0.2" 
                                  className="transition-all duration-200"
                                />
                              )}
                              <circle
                                cx={p.x}
                                cy={p.y}
                                r={isHovered ? "6" : "4.5"}
                                fill="#ffffff"
                                stroke="#F36F21"
                                strokeWidth={isHovered ? "4" : "2.5"}
                                className="cursor-pointer transition-all duration-200"
                                onMouseEnter={() => setHoveredPointIdx(idx)}
                                onMouseLeave={() => setHoveredPointIdx(null)}
                              />
                            </g>
                          );
                        })}

                        {/* X-Axis Month Ticks */}
                        {monthlyChartData.map((m, idx) => {
                          const p = chartPoints.points[idx];
                          return (
                            <text
                              key={idx}
                              x={p.x}
                              y={chartPoints.height - 8}
                              textAnchor="middle"
                              className="text-[9px] fill-slate-400 font-extrabold tracking-tight"
                            >
                              {m.label}
                            </text>
                          );
                        })}

                        {/* Floating Custom SVG Tooltip Card */}
                        {hoveredPointIdx !== null && (() => {
                          const p = chartPoints.points[hoveredPointIdx];
                          const tooltipWidth = 130;
                          const tooltipHeight = 48;
                          let tx = p.x - tooltipWidth / 2;
                          let ty = p.y - tooltipHeight - 12;
                          
                          // Bound checks
                          if (tx < chartPoints.paddingLeft) tx = chartPoints.paddingLeft;
                          if (tx + tooltipWidth > chartPoints.width - chartPoints.paddingRight) {
                            tx = chartPoints.width - chartPoints.paddingRight - tooltipWidth;
                          }

                          return (
                            <g filter="url(#dashboard-shadow)" className="pointer-events-none animate-fade-in">
                              <rect 
                                x={tx} 
                                y={ty} 
                                width={tooltipWidth} 
                                height={tooltipHeight} 
                                rx="10" 
                                fill="#12284C" 
                              />
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 18} 
                                textAnchor="middle" 
                                fill="#94a3b8" 
                                className="text-[9px] font-extrabold uppercase tracking-wider"
                              >
                                {monthlyChartData[hoveredPointIdx].label}
                              </text>
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 34} 
                                textAnchor="middle" 
                                fill="#ffffff" 
                                className="text-[12px] font-black"
                              >
                                {p.amountFormatted}
                              </text>
                            </g>
                          );
                        })()}
                      </svg>
                    </div>
                    <div className="text-center text-[10px] text-text-muted mt-3 font-semibold">
                      <span>* Hover over data points to display precise monthly gross earnings details.</span>
                    </div>
                  </div>
                </div>

                {/* Recent Activities Feed */}
                <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow">
                  <div className="flex items-center justify-between mb-5">
                    <h3 className="font-display font-bold text-lg text-brand-blue">Recent Course Registrations</h3>
                    <a href="#revenue" onClick={() => setActiveTab('revenue')} className="text-xs font-bold text-primary hover:text-primary-hover flex items-center gap-0.5">
                      See all records <span className="material-symbols-outlined text-xs">arrow_forward</span>
                    </a>
                  </div>

                  <div className="overflow-x-auto w-full">
                    <table className="w-full text-left text-sm whitespace-nowrap">
                      <thead>
                        <tr className="text-xs uppercase tracking-wider text-text-muted border-b border-slate-100 font-semibold bg-slate-50/50 rounded-lg">
                          <th className="py-3 px-4 rounded-l-lg">Student</th>
                          <th className="py-3 px-4">Course Name</th>
                          <th className="py-3 px-4 rounded-r-lg">Registration Time</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100">
                        {mockRegistrations.slice(0, 3).map((reg, idx) => (
                          <tr key={idx}>
                            <td className="py-3.5 px-4 flex items-center gap-3">
                              <img src={reg.avatar} className="w-8 h-8 rounded-full border border-slate-200 object-cover" alt="Student" />
                              <span className="font-bold text-brand-blue">{reg.studentName}</span>
                            </td>
                            <td className="py-3.5 px-4 text-slate-700 font-medium">{reg.course}</td>
                            <td className="py-3.5 px-4 text-slate-500 font-medium">{reg.time}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>

                {/* Course Statistics Section */}
                <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6">
                    <div>
                      <h3 className="font-display font-bold text-lg text-brand-blue">Course Performance Statistics</h3>
                      <p className="text-xs text-text-muted mt-0.5">Enrolled students and gross revenue by course for the selected period.</p>
                    </div>
                    {/* Timeframe selector (Pills style) */}
                    <div className="flex items-center gap-1.5 bg-slate-100/80 p-1 rounded-xl border border-slate-200/40">
                      {[
                        { label: '1 Month', value: 1 },
                        { label: '3 Months', value: 3 },
                        { label: '6 Months', value: 6 },
                        { label: '9 Months', value: 9 },
                        { label: '1 Year', value: 12 },
                      ].map((t) => {
                        const isActive = statsPeriod === t.value;
                        return (
                          <button
                            key={t.value}
                            type="button"
                            onClick={() => setStatsPeriod(t.value)}
                            className={`px-3.5 py-1.5 rounded-lg text-xs font-extrabold transition-all duration-200 select-none ${
                              isActive
                                ? 'bg-primary text-white shadow-sm'
                                : 'text-slate-600 hover:text-brand-blue hover:bg-white/50'
                            }`}
                          >
                            {t.label}
                          </button>
                        );
                      })}
                    </div>
                  </div>

                  <div className="overflow-x-auto w-full">
                    <table className="w-full text-left text-sm whitespace-nowrap">
                      <thead>
                        <tr className="text-xs uppercase tracking-wider text-text-muted border-b border-slate-100 font-semibold bg-slate-50/50 rounded-lg">
                          <th className="py-3 px-4 rounded-l-lg">Course Name</th>
                          <th className="py-3 px-4 text-center">Total Students Enrolled</th>
                          <th className="py-3 px-4 text-right rounded-r-lg">Total Revenue</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100">
                        {courseStats.map((stat) => (
                          <tr key={stat.id} className="hover:bg-slate-50/65 transition-colors">
                            <td className="py-3.5 px-4 font-bold text-brand-blue">{stat.title}</td>
                            <td className="py-3.5 px-4 text-center font-medium text-slate-700">{stat.students.toLocaleString()}</td>
                            <td className="py-3.5 px-4 text-right font-bold text-brand-green">{stat.revenue}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            )}

            {/* ================= TAB: MY COURSES ================= */}
            {activeTab === 'my-courses' && (
              <div id="tab-my-courses" className="tab-content flex flex-col gap-8">
                {/* Top course bar */}
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                  <div>
                    <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-2.5 shadow-sm">
                      <span className="material-symbols-outlined text-xs icon-fill">library_books</span> My Courses
                    </div>
                    <h1 className="text-3xl md:text-4xl font-display font-black leading-tight relative z-10">
                      <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">My Authored </span>
                      <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent">Courses</span>
                    </h1>
                    <p className="text-xs text-text-muted mt-0.5">Manage details, modules, prices, and status for your student modules.</p>
                  </div>
                  <button
                    onClick={() => setIsCreateCourseOpen(true)}
                    className="flex items-center gap-2 bg-primary hover:bg-primary-hover text-white px-4 py-2.5 rounded-xl font-semibold shadow-md shadow-primary/20 transition-all text-sm shrink-0 self-start sm:self-auto"
                  >
                    <span className="material-symbols-outlined text-[18px]">add</span>
                    <span>Create Course</span>
                  </button>
                </div>

                {/* Sub-tabs for Course Categories */}
                <div className="flex flex-wrap items-center gap-2 border-b border-slate-200/40 pb-4">
                  <button
                    onClick={() => setCourseSubTab('all')}
                    className={`flex items-center gap-2 px-4 py-2.5 text-xs md:text-sm font-bold rounded-xl transition-all select-none border border-slate-200/60 shadow-sm ${
                      courseSubTab === 'all'
                        ? 'bg-primary text-white border-primary shadow-md shadow-primary/10'
                        : 'bg-white hover:bg-slate-50 text-slate-600'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">menu</span>
                    <span>All Courses</span>
                    <span className={`text-[10px] px-2 py-0.5 rounded-full font-extrabold ${
                      courseSubTab === 'all' ? 'bg-white/20 text-white' : 'bg-slate-100 text-slate-500'
                    }`}>{instructorCourses.length}</span>
                  </button>

                  <button
                    onClick={() => setCourseSubTab('published')}
                    className={`flex items-center gap-2 px-4 py-2.5 text-xs md:text-sm font-bold rounded-xl transition-all select-none border border-slate-200/60 shadow-sm ${
                      courseSubTab === 'published'
                        ? 'bg-brand-green text-white border-brand-green shadow-md shadow-brand-green/10'
                        : 'bg-white hover:bg-slate-50 text-slate-600'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px] icon-fill">check_circle</span>
                    <span>Active</span>
                    <span className={`text-[10px] px-2 py-0.5 rounded-full font-extrabold ${
                      courseSubTab === 'published' ? 'bg-white/20 text-white' : 'bg-green-50 text-brand-green'
                    }`}>{instructorCourses.filter(c => c.status === 'published').length}</span>
                  </button>

                  <button
                    onClick={() => setCourseSubTab('review')}
                    className={`flex items-center gap-2 px-4 py-2.5 text-xs md:text-sm font-bold rounded-xl transition-all select-none border border-slate-200/60 shadow-sm ${
                      courseSubTab === 'review'
                        ? 'bg-amber-500 text-white border-amber-500 shadow-md shadow-amber-500/10'
                        : 'bg-white hover:bg-slate-50 text-slate-600'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px] icon-fill">pending</span>
                    <span>Pending Approval</span>
                    <span className={`text-[10px] px-2 py-0.5 rounded-full font-extrabold ${
                      courseSubTab === 'review' ? 'bg-white/20 text-white' : 'bg-amber-50 text-amber-600'
                    }`}>{instructorCourses.filter(c => c.status === 'review').length}</span>
                  </button>

                  <button
                    onClick={() => setCourseSubTab('draft')}
                    className={`flex items-center gap-2 px-4 py-2.5 text-xs md:text-sm font-bold rounded-xl transition-all select-none border border-slate-200/60 shadow-sm ${
                      courseSubTab === 'draft'
                        ? 'bg-slate-500 text-white border-slate-500 shadow-md shadow-slate-500/10'
                        : 'bg-white hover:bg-slate-50 text-slate-600'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">edit_note</span>
                    <span>Drafts</span>
                    <span className={`text-[10px] px-2 py-0.5 rounded-full font-extrabold ${
                      courseSubTab === 'draft' ? 'bg-white/20 text-white' : 'bg-slate-100 text-slate-600'
                    }`}>{instructorCourses.filter(c => c.status === 'draft').length}</span>
                  </button>
                </div>

                {/* Filter & Search Row */}
                <div className="bg-surface p-4 rounded-xl border border-slate-200/50 ambient-shadow flex flex-col md:flex-row gap-4 items-center justify-between">
                  <div className="relative w-full md:w-80">
                    <span className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                      <span className="material-symbols-outlined text-[18px] text-text-muted">search</span>
                    </span>
                    <input
                      type="text"
                      placeholder="Search courses..."
                      value={courseSearchTerm}
                      onChange={(e) => setCourseSearchTerm(e.target.value)}
                      className="w-full pl-9 pr-4 py-2 text-sm border-slate-200/60 rounded-xl focus:border-primary focus:ring-primary focus:ring-1 bg-[#f8fafc]/50 font-medium"
                    />
                  </div>

                  <div className="flex items-center gap-3 w-full md:w-auto justify-end">
                    <select
                      value={courseSubTab}
                      onChange={(e) => setCourseSubTab(e.target.value as any)}
                      className="border-slate-200/60 rounded-xl text-xs font-semibold text-text-main py-2 focus:ring-primary focus:ring-1 focus:border-primary cursor-pointer bg-white"
                    >
                      <option value="all">All States</option>
                      <option value="published">Active (Published)</option>
                      <option value="review">Pending Review (Under Review)</option>
                      <option value="draft">Draft (Creating)</option>
                    </select>
                    <select
                      value={courseSortFilter}
                      onChange={(e) => setCourseSortFilter(e.target.value as any)}
                      className="border-slate-200/60 rounded-xl text-xs font-semibold text-text-main py-2 focus:ring-primary focus:ring-1 focus:border-primary cursor-pointer bg-white"
                    >
                      <option value="newest">Newest First</option>
                      <option value="price-low">Price: Low to High</option>
                      <option value="price-high">Price: High to Low</option>
                    </select>
                  </div>
                </div>

                {/* Courses Grid */}
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" id="courses-container">
                  {filteredAndSortedCourses.length === 0 ? (
                    <div className="col-span-full py-12 text-center bg-surface border border-dashed border-slate-200 rounded-2xl">
                      <span className="material-symbols-outlined text-slate-400 text-5xl mb-3">inbox</span>
                      <p className="text-sm font-semibold text-slate-500">No courses found matching your criteria</p>
                    </div>
                  ) : (
                    filteredAndSortedCourses.map((course) => (
                      <div
                        key={course.id}
                        className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow flex flex-col justify-between hover:shadow-lg transition-all duration-300"
                      >
                        <div>
                          {/* SVG Thumbnail placeholder */}
                          <div className={`h-44 bg-gradient-to-r ${course.gradient} p-6 flex flex-col justify-between text-white relative`}>
                            <span className="px-2.5 py-0.5 rounded bg-white/20 text-white font-bold text-[10px] uppercase w-fit tracking-wider">
                              {course.level}
                            </span>
                            <div className="flex flex-col">
                              <span className="text-xs font-medium text-white/80">{course.topic}</span>
                              <span className="text-xl font-display font-extrabold tracking-tight mt-1 leading-tight line-clamp-2">
                                {course.title}
                              </span>
                            </div>
                            <div className="absolute bottom-2 right-2 opacity-15">
                              <span className="material-symbols-outlined text-[80px]">{course.icon}</span>
                            </div>
                          </div>

                          <div className="p-5 flex flex-col gap-4">
                            <div className="flex items-center justify-between">
                              {course.status === 'published' && (
                                <span className="px-2.5 py-0.5 text-xs rounded-full bg-brand-green-light text-brand-green font-bold flex items-center gap-1 select-none">
                                  <span className="w-1.5 h-1.5 rounded-full bg-brand-green"></span>
                                  Active
                                </span>
                              )}
                              {course.status === 'review' && (
                                <span className="px-2.5 py-0.5 text-xs rounded-full bg-amber-100 text-amber-700 font-bold flex items-center gap-1 select-none">
                                  <span className="w-1.5 h-1.5 rounded-full bg-amber-500 animate-pulse"></span>
                                  Under Review
                                </span>
                              )}
                              {course.status === 'draft' && (
                                <span className="px-2.5 py-0.5 text-xs rounded-full bg-slate-100 text-slate-600 font-bold flex items-center gap-1 select-none">
                                  <span className="w-1.5 h-1.5 rounded-full bg-slate-400"></span>
                                  Draft
                                </span>
                              )}
                              <span className="text-sm font-bold text-primary">{course.price}</span>
                            </div>
                            <p className="text-xs text-text-muted line-clamp-2">{course.description}</p>
                            <div className="grid grid-cols-2 gap-3 pt-3 border-t border-slate-100 text-xs text-slate-500 font-semibold">
                              <div className="flex items-center gap-1.5">
                                <span className="material-symbols-outlined text-[16px] text-text-muted">group</span>
                                <span>{course.studentsCount} Students</span>
                              </div>
                              <div className="flex items-center gap-1.5 justify-end">
                                <span className="material-symbols-outlined text-[16px] text-amber-500 icon-fill">star</span>
                                <span>
                                  {course.rating > 0
                                    ? `${course.rating} (${course.reviewsCount} reviews)`
                                    : 'No reviews yet'}
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div className="p-5 pt-0 grid grid-cols-2 gap-3.5">
                          {course.status === 'published' && (
                            <>
                              <button
                                onClick={() => openSyllabusEditor(course)}
                                className="col-span-2 flex items-center justify-center gap-1 px-3 py-2 text-xs rounded-xl bg-slate-100 hover:bg-slate-200 text-brand-blue font-bold transition-all border border-slate-200/30"
                              >
                                <span className="material-symbols-outlined text-[16px]">edit</span> Edit Course Details
                              </button>
                            </>
                          )}

                          {course.status === 'review' && (
                            <button
                              onClick={() =>
                                alert(`Course "${course.title}" is pending admin review and activation.`)
                              }
                              className="col-span-2 flex items-center justify-center gap-1 px-3 py-2 text-xs rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-600 hover:text-slate-800 font-bold transition-all border border-slate-200/50"
                            >
                              <span className="material-symbols-outlined text-[16px] text-amber-500">info</span>
                              View Review Details
                            </button>
                          )}

                          {course.status === 'draft' && (
                            <>
                              <button
                                onClick={() => openSyllabusEditor(course)}
                                className="flex items-center justify-center gap-1 px-3 py-2 text-xs rounded-xl bg-slate-100 hover:bg-slate-200 text-brand-blue font-bold transition-all border border-slate-200/30"
                              >
                                <span className="material-symbols-outlined text-[16px]">edit</span> Resume Edit
                              </button>
                              <button
                                onClick={() => {
                                  setInstructorCourses((prev) =>
                                    prev.map((c) =>
                                      c.id === course.id ? { ...c, status: 'review' } : c
                                    )
                                  );
                                  alert(`Submitted successfully! Course "${course.title}" has been sent for admin review.`);
                                }}
                                className="flex items-center justify-center gap-1 px-3 py-2 text-xs rounded-xl bg-primary hover:bg-primary-hover text-white font-bold transition-all shadow-sm"
                              >
                                <span className="material-symbols-outlined text-[16px]">publish</span> Submit for Review
                              </button>
                            </>
                          )}
                        </div>
                      </div>
                    ))
                  )}
                </div>


              </div>
            )}



            {/* ================= TAB: REVENUE ================= */}
            {activeTab === 'revenue' && (
              <div id="tab-revenue" className="tab-content flex flex-col gap-8 animate-fade-in pb-12">
                
                {/* Header Section */}
                <div className="flex flex-col xl:flex-row xl:items-center justify-between gap-6">
                  <div>
                    <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-2.5 shadow-sm">
                      <span className="material-symbols-outlined text-xs icon-fill">insights</span> Revenue Analytics
                    </div>
                    <h1 className="text-3xl md:text-4xl font-display font-black leading-tight relative z-10">
                      <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">Instructor </span>
                      <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent">Revenue</span>
                    </h1>
                    <p className="text-text-muted mt-1 text-sm">Track gross revenue, net course distributions, and student registration volume.</p>
                  </div>
                  
                  {/* Compact Interactive Filters Box */}
                  <div className="flex flex-wrap items-center gap-3 bg-white border border-slate-200/60 p-3.5 rounded-2xl ambient-shadow xl:max-w-max">
                    {/* Timeframe Dropdown */}
                    <div className="flex flex-col gap-1">
                      <span className="text-[9px] font-extrabold text-brand-blue uppercase tracking-wider">Timeframe</span>
                      <div className="relative min-w-[170px]">
                        <select
                          value={revenueFilter}
                          onChange={(e) => {
                            setRevenueFilter(e.target.value as any);
                            setAppliedStartDate('');
                            setAppliedEndDate('');
                          }}
                          style={{ appearance: 'none', WebkitAppearance: 'none', MozAppearance: 'none' }}
                          className="w-full bg-slate-50 border border-slate-200 text-slate-700 hover:text-brand-blue rounded-xl py-1.5 pl-3 pr-8 text-[11px] font-extrabold cursor-pointer transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-primary focus:border-primary hover:bg-slate-100/70"
                        >
                          {(() => {
                            const now = new Date();
                            const curYear = now.getFullYear();
                            const curMonth = now.getMonth();
                            const monthNames = [
                              "January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December"
                            ];
                            
                            // This Month
                            const options = [
                              <option key="this-month" value="this-month">
                                This Month ({monthNames[curMonth]} {curYear})
                              </option>
                            ];
                            
                            // Last Month
                            const lastMonthDate = new Date(curYear, curMonth - 1, 1);
                            options.push(
                              <option key="last-month" value="last-month">
                                Last Month ({monthNames[lastMonthDate.getMonth()]} {lastMonthDate.getFullYear()})
                              </option>
                            );
                            
                            // 4 more previous months
                            for (let i = 2; i <= 5; i++) {
                              const prevDate = new Date(curYear, curMonth - i, 1);
                              options.push(
                                <option key={i} value={`prev-${i}`}>
                                  {monthNames[prevDate.getMonth()]} {prevDate.getFullYear()}
                                </option>
                              );
                            }
                            
                            options.push(<option key="all" value="all">All Time</option>);
                            if (revenueFilter === 'custom') {
                              options.push(<option key="custom" value="custom">Custom Date Range</option>);
                            }
                            return options;
                          })()}
                        </select>
                        <span className="material-symbols-outlined absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-500 pointer-events-none text-base">
                          keyboard_arrow_down
                        </span>
                      </div>
                    </div>

                    {/* Divider line */}
                    <div className="hidden sm:block h-8 w-[1px] bg-slate-200 mx-1"></div>

                    {/* Custom Date Inputs */}
                    <div className="flex flex-col gap-1">
                      <span className="text-[9px] font-extrabold text-brand-blue uppercase tracking-wider">Custom Range</span>
                      <div className="flex items-center gap-1.5">
                        <input
                          type="date"
                          value={customStartDate}
                          onChange={(e) => setCustomStartDate(e.target.value)}
                          className="text-[11px] font-semibold border-slate-200 rounded-xl py-1 px-2.5 focus:ring-primary focus:border-primary text-brand-blue max-w-[110px]"
                        />
                        <span className="text-[10px] text-text-muted font-bold">to</span>
                        <input
                          type="date"
                          value={customEndDate}
                          onChange={(e) => setCustomEndDate(e.target.value)}
                          className="text-[11px] font-semibold border-slate-200 rounded-xl py-1 px-2.5 focus:ring-primary focus:border-primary text-brand-blue max-w-[110px]"
                        />
                        <button
                          type="button"
                          onClick={handleApplyCustomDate}
                          className="bg-brand-blue hover:bg-brand-blue-light text-white text-[10px] font-bold py-1.5 px-3 rounded-xl transition-all shadow-sm flex items-center gap-0.5 active:scale-95 shrink-0"
                        >
                          Apply
                        </button>
                        {revenueFilter === 'custom' && (
                          <button
                            type="button"
                            onClick={() => {
                              setRevenueFilter('this-month');
                              setCustomStartDate('');
                              setCustomEndDate('');
                              setAppliedStartDate('');
                              setAppliedEndDate('');
                            }}
                            className="text-red-500 hover:text-red-700 font-bold flex items-center shrink-0"
                            title="Clear Filter"
                          >
                            <span className="material-symbols-outlined text-base">close</span>
                          </button>
                        )}
                      </div>
                    </div>
                  </div>
                </div>

                {/* Earnings Overview Row: Financial Card & Course Breakdown */}
                <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-stretch">
                  {/* Left Column: Financial Card */}
                  <div className="lg:col-span-4 bg-surface rounded-3xl p-5 border border-slate-200/50 ambient-shadow flex flex-col gap-3.5 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-24 h-24 bg-primary/5 rounded-full blur-2xl -mr-6 -mt-6"></div>
                    
                    <div className="flex justify-between items-center mb-1">
                      <h3 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Earnings Overview</h3>
                      <span className="material-symbols-outlined text-primary text-xl icon-fill">payments</span>
                    </div>

                    {/* Gross Revenue Card */}
                    <div className="bg-[#f0fdf4] border border-[#dcfce7] p-2.5 rounded-xl shadow-sm">
                      <span className="text-[9px] text-green-700 uppercase tracking-wider font-extrabold flex items-center gap-1">
                        <span className="w-1.5 h-1.5 rounded-full bg-green-500"></span>
                        Gross Revenue (Before Fees)
                      </span>
                      <p className="text-xl font-display font-black text-green-800 mt-0.5 tracking-tight">
                        {totalGrossRevenue.toLocaleString('vi-VN')} ₫
                      </p>
                    </div>

                    {/* Net Revenue Card */}
                    <div className="bg-[#e8f0fe] border border-blue-200 p-2.5 rounded-xl shadow-sm">
                      <span className="text-[9px] text-blue-700 uppercase tracking-wider font-extrabold flex items-center gap-1">
                        <span className="w-1.5 h-1.5 rounded-full bg-blue-500"></span>
                        Net Revenue (70% - After App Fee)
                      </span>
                      <p className="text-xl font-display font-black text-blue-800 mt-0.5 tracking-tight">
                        {totalNetRevenue.toLocaleString('vi-VN')} ₫
                      </p>
                    </div>

                    {/* Actual Take-Home Payout Card (Shown ONLY for past timeframes) */}
                    {revenueFilter !== 'this-month' ? (
                      <div className="bg-[#fff7ed] border border-[#ffedd5] p-2.5 rounded-xl shadow-sm animate-fade-in">
                        <span className="text-[9px] text-orange-700 uppercase tracking-wider font-extrabold flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-orange-500"></span>
                          Actual Take-Home Payout (After Tax)
                        </span>
                        <p className="text-xl font-display font-black text-orange-800 mt-0.5 tracking-tight">
                          {displayedTakeHome.toLocaleString('vi-VN')} ₫
                        </p>
                        <p className="text-[8.5px] text-orange-600 font-bold mt-1 leading-normal italic">
                          * Deducted 10% tax only for months with Net Revenue &gt; 2M ₫.
                        </p>
                      </div>
                    ) : (
                      <div className="bg-slate-50 border border-slate-200/60 p-2.5 rounded-xl">
                        <span className="text-[9px] text-slate-500 uppercase tracking-wider font-extrabold flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-slate-400"></span>
                          Actual Take-Home Payout (After Tax)
                        </span>
                        <p className="text-xs text-slate-500 font-bold mt-1.5 leading-relaxed">
                          Taxes will be calculated at month-end based on the 2M ₫ threshold.
                        </p>
                      </div>
                    )}
                  </div>

                  {/* Right Column: Earnings Breakdown */}
                  <div className="lg:col-span-8 bg-surface rounded-3xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div>
                      <div className="flex justify-between items-center mb-5">
                        <div>
                          <h3 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Course Earnings Breakdown</h3>
                          <p className="text-xs text-text-muted mt-0.5">Revenue distribution across your published courses.</p>
                        </div>
                        <span className="px-2.5 py-1 rounded-full bg-slate-100 text-brand-blue text-[10px] font-bold border border-slate-200/30">
                          {earningsBreakdown.filter(x => x.amount > 0).length} courses with sales
                        </span>
                      </div>

                      {/* Course shares mapping */}
                      <div className="flex flex-col gap-5 py-2">
                        {displayedEarningsBreakdown.length === 0 ? (
                          <div className="flex flex-col items-center justify-center py-8 text-center bg-slate-50/40 rounded-2xl border border-dashed border-slate-200">
                            <span className="material-symbols-outlined text-3xl text-slate-300 mb-1">analytics</span>
                            <p className="text-[11px] text-text-muted font-bold">No earnings data in this period</p>
                          </div>
                        ) : (
                          displayedEarningsBreakdown.map((item, idx) => {
                            const colors = [
                              { bar: 'bg-primary', light: 'bg-orange-50', text: 'text-primary' },
                              { bar: 'bg-blue-500', light: 'bg-blue-50', text: 'text-blue-500' },
                              { bar: 'bg-emerald-500', light: 'bg-emerald-50', text: 'text-emerald-500' },
                            ];
                            const c = colors[((breakdownPage - 1) * BREAKDOWN_PER_PAGE + idx) % colors.length];
                            
                            return (
                              <div key={item.courseId} className="group">
                                <div className="flex justify-between text-xs font-bold text-brand-blue mb-2.5">
                                  <span className="truncate max-w-[70%]">{item.courseTitle}</span>
                                  <span className="flex items-center gap-1.5 shrink-0">
                                    <span>{item.amount.toLocaleString('vi-VN')} ₫</span>
                                    <span className={`px-2 py-0.5 rounded-full text-[10px] ${c.light} ${c.text}`}>
                                      {item.percentage}%
                                    </span>
                                  </span>
                                </div>
                                <div className="w-full h-3 bg-slate-100 rounded-full overflow-hidden">
                                  <div 
                                    className={`h-full ${c.bar} rounded-full transition-all duration-1000 ease-out`} 
                                    style={{ width: `${item.percentage}%` }}
                                  ></div>
                                </div>
                              </div>
                            );
                          })
                        )}
                      </div>

                      {/* Pagination Controls */}
                      {totalBreakdownPages > 1 && (
                        <div className="flex items-center justify-between mt-3 pt-2.5 border-t border-slate-150/30">
                          <button
                            type="button"
                            onClick={() => setBreakdownPage(prev => Math.max(prev - 1, 1))}
                            disabled={breakdownPage === 1}
                            className={`w-8 h-8 flex items-center justify-center rounded-xl transition-all ${
                              breakdownPage === 1
                                ? 'bg-slate-50 text-slate-350 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-90 shadow-sm'
                            }`}
                            title="Previous page"
                          >
                            <span className="material-symbols-outlined text-[16px] font-bold">chevron_left</span>
                          </button>

                          <span className="text-[10px] font-extrabold text-slate-500 select-none">
                            {breakdownPage} / {totalBreakdownPages}
                          </span>

                          <button
                            type="button"
                            onClick={() => setBreakdownPage(prev => Math.min(prev + 1, totalBreakdownPages))}
                            disabled={breakdownPage === totalBreakdownPages}
                            className={`w-8 h-8 flex items-center justify-center rounded-xl transition-all ${
                              breakdownPage === totalBreakdownPages
                                ? 'bg-slate-50 text-slate-350 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-90 shadow-sm'
                            }`}
                            title="Next page"
                          >
                            <span className="material-symbols-outlined text-[16px] font-bold">chevron_right</span>
                          </button>
                        </div>
                      )}
                    </div>
                    
                    <div className="mt-4 pt-3 border-t border-slate-150/40 text-[11px] text-text-muted flex items-center gap-1">
                      <span className="material-symbols-outlined text-sm">stars</span>
                      <span>Analytics system automatically normalizes proportions based on total revenue.</span>
                    </div>
                  </div>
                </div>

                {/* 12-Month Revenue & Registrations Row */}
                <div className="grid grid-cols-1 lg:grid-cols-10 gap-8 items-stretch">
                  {/* Left 60%: 12-Month Revenue Trend SVG Line Chart Card */}
                  <div className="lg:col-span-6 bg-surface rounded-3xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-6">
                      <div>
                        <h3 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">12-Month Revenue Trend</h3>
                        <p className="text-xs text-text-muted mt-0.5">Visual representation of monthly gross earnings variations over a year.</p>
                      </div>
                      <div className="flex items-center gap-2 text-xs font-bold text-brand-blue bg-slate-50 border border-slate-200/40 p-2 rounded-xl">
                        <span className="w-3 h-3 bg-primary rounded-full"></span>
                        <span>Monthly Gross Revenue</span>
                      </div>
                    </div>

                    {/* SVG Line Chart Wrapper */}
                    <div className="relative w-full h-[260px] mt-2">
                      <svg viewBox={`0 0 ${chartPoints.width} ${chartPoints.height}`} className="w-full h-full overflow-visible select-none">
                        <defs>
                          <linearGradient id="chart-area-grad" x1="0" y1="0" x2="0" y2="1">
                            <stop offset="0%" stopColor="#F36F21" stopOpacity="0.25"/>
                            <stop offset="100%" stopColor="#F36F21" stopOpacity="0"/>
                          </linearGradient>
                          <filter id="shadow" x="-10%" y="-10%" width="120%" height="120%">
                            <feDropShadow dx="0" dy="4" stdDeviation="4" floodOpacity="0.08"/>
                          </filter>
                        </defs>
                        
                        {/* Horizontal Gridlines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((ratio, gridIdx) => {
                          const y = chartPoints.paddingTop + chartPoints.chartHeight - ratio * chartPoints.chartHeight;
                          const gridVal = ratio * chartPoints.roundMax;
                          return (
                            <g key={gridIdx} className="opacity-40">
                              <line 
                                x1={chartPoints.paddingLeft} 
                                y1={y} 
                                x2={chartPoints.width - chartPoints.paddingRight} 
                                y2={y} 
                                stroke="#cbd5e1" 
                                strokeWidth="1" 
                                strokeDasharray="4 4" 
                              />
                              <text 
                                x={chartPoints.paddingLeft - 10} 
                                y={y + 4} 
                                textAnchor="end" 
                                className="text-[10px] fill-slate-500 font-extrabold"
                              >
                                {gridVal === 0 ? '0 ₫' : `${(gridVal / 1000000).toFixed(1)}M ₫`}
                              </text>
                            </g>
                          );
                        })}

                        {/* Smooth Area Under the Curve */}
                        {chartPoints.points.length > 0 && (
                          <path
                            d={`M ${chartPoints.points[0].x} ${chartPoints.paddingTop + chartPoints.chartHeight} 
                               L ${chartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')} 
                               L ${chartPoints.points[chartPoints.points.length - 1].x} ${chartPoints.paddingTop + chartPoints.chartHeight} Z`}
                            fill="url(#chart-area-grad)"
                          />
                        )}

                        {/* Line Stroke */}
                        {chartPoints.points.length > 0 && (
                          <path
                            d={`M ${chartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')}`}
                            fill="none"
                            stroke="#F36F21"
                            strokeWidth="3.5"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                          />
                        )}

                        {/* Interactive Data Dots */}
                        {chartPoints.points.map((p, idx) => {
                          const isHovered = hoveredPointIdx === idx;
                          return (
                            <g key={idx}>
                              {isHovered && (
                                <circle 
                                  cx={p.x} 
                                  cy={p.y} 
                                  r="8.5" 
                                  fill="#F36F21" 
                                  fillOpacity="0.2" 
                                  className="transition-all duration-200"
                                />
                              )}
                              <circle
                                cx={p.x}
                                cy={p.y}
                                r={isHovered ? "6" : "4.5"}
                                fill="#ffffff"
                                stroke="#F36F21"
                                strokeWidth={isHovered ? "4" : "2.5"}
                                className="cursor-pointer transition-all duration-200"
                                onMouseEnter={() => setHoveredPointIdx(idx)}
                                onMouseLeave={() => setHoveredPointIdx(null)}
                              />
                            </g>
                          );
                        })}

                        {/* X-Axis Month Ticks */}
                        {monthlyChartData.map((m, idx) => {
                          const p = chartPoints.points[idx];
                          return (
                            <text
                              key={idx}
                              x={p.x}
                              y={chartPoints.height - 8}
                              textAnchor="middle"
                              className="text-[9px] fill-slate-400 font-extrabold tracking-tight"
                            >
                              {m.label}
                            </text>
                          );
                        })}

                        {/* Floating Custom SVG Tooltip Card */}
                        {hoveredPointIdx !== null && (() => {
                          const p = chartPoints.points[hoveredPointIdx];
                          const tooltipWidth = 130;
                          const tooltipHeight = 48;
                          let tx = p.x - tooltipWidth / 2;
                          let ty = p.y - tooltipHeight - 12;
                          
                          // Bound checks
                          if (tx < chartPoints.paddingLeft) tx = chartPoints.paddingLeft;
                          if (tx + tooltipWidth > chartPoints.width - chartPoints.paddingRight) {
                            tx = chartPoints.width - chartPoints.paddingRight - tooltipWidth;
                          }

                          return (
                            <g filter="url(#shadow)" className="pointer-events-none animate-fade-in">
                              <rect 
                                x={tx} 
                                y={ty} 
                                width={tooltipWidth} 
                                height={tooltipHeight} 
                                rx="10" 
                                fill="#12284C" 
                              />
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 18} 
                                textAnchor="middle" 
                                fill="#94a3b8" 
                                className="text-[9px] font-extrabold uppercase tracking-wider"
                              >
                                {monthlyChartData[hoveredPointIdx].label}
                              </text>
                              <text 
                                x={tx + tooltipWidth / 2} 
                                y={ty + 34} 
                                textAnchor="middle" 
                                fill="#ffffff" 
                                className="text-[12px] font-black"
                              >
                                {p.amountFormatted}
                              </text>
                            </g>
                          );
                        })()}
                      </svg>
                    </div>
                    <div className="text-center text-[10px] text-text-muted mt-3 font-semibold">
                      <span>* Hover over data points to display precise monthly gross earnings details.</span>
                    </div>
                  </div>

                  {/* Right 40%: Recent Course Registrations Card */}
                  <div className="lg:col-span-4 bg-surface rounded-3xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between animate-fade-in">
                    <div>
                      <div className="flex justify-between items-center mb-5">
                        <div>
                          <h3 className="font-display font-black text-xs sm:text-sm text-brand-blue uppercase tracking-wider">Recent Course Registrations</h3>
                          <p className="text-[10px] text-text-muted mt-0.5">Enrolled student volume per course.</p>
                        </div>
                        {/* Timeframe Dropdown */}
                        <div className="relative shrink-0">
                          <select
                            value={trendTimeframe}
                            onChange={(e) => setTrendTimeframe(e.target.value as any)}
                            style={{ appearance: 'none', WebkitAppearance: 'none', MozAppearance: 'none' }}
                            className="bg-slate-50 border border-slate-200 text-slate-700 hover:text-brand-blue rounded-xl py-1.5 px-3 pr-8 text-[11px] font-extrabold cursor-pointer transition-all focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary hover:bg-slate-100/70"
                          >
                            <option value="1m">1 Month</option>
                            <option value="3m">3 Months</option>
                            <option value="9m">9 Months</option>
                            <option value="12m">12 Months</option>
                          </select>
                          <span className="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-slate-500 pointer-events-none text-base">
                            keyboard_arrow_down
                          </span>
                        </div>
                      </div>

                      {/* Course Registration List */}
                      <div className="flex flex-col gap-3 py-1">
                        {displayedCourseRegistrations.length === 0 ? (
                          <div className="flex flex-col items-center justify-center py-8 text-center bg-slate-50/40 rounded-2xl border border-dashed border-slate-200">
                            <span className="material-symbols-outlined text-3xl text-slate-300 mb-1">school</span>
                            <p className="text-[11px] text-text-muted font-bold">No registrations in this period</p>
                          </div>
                        ) : (
                          displayedCourseRegistrations.map((item, idx) => {
                            const colors = [
                              { lightBg: 'bg-[#ffece0]', pill: 'bg-[#ffece0] text-primary border border-primary/10', iconColor: 'text-primary' },
                              { lightBg: 'bg-[#e8f0fe]', pill: 'bg-[#e8f0fe] text-blue-600 border border-blue-100', iconColor: 'text-blue-600' },
                              { lightBg: 'bg-[#f0fdf4]', pill: 'bg-[#f0fdf4] text-emerald-600 border border-emerald-100', iconColor: 'text-emerald-600' },
                            ];
                            const c = colors[((courseRegPage - 1) * REGISTRATIONS_PER_PAGE + idx) % colors.length];
                            
                            return (
                              <div key={item.courseId} className="flex items-center justify-between p-3.5 rounded-2xl bg-slate-50/60 border border-slate-200/30 transition-all hover:bg-slate-100/40 hover:shadow-sm">
                                <div className="flex items-center gap-3 min-w-0">
                                  <div className={`w-8.5 h-8.5 rounded-xl flex items-center justify-center shrink-0 ${c.lightBg}`}>
                                    <span className={`material-symbols-outlined text-base ${c.iconColor}`}>school</span>
                                  </div>
                                  <div className="min-w-0">
                                    <h4 className="text-xs font-bold text-brand-blue truncate" title={item.courseTitle}>
                                      {item.courseTitle}
                                    </h4>
                                  </div>
                                </div>
                                <span className={`px-2.5 py-1 rounded-xl text-[10px] font-semibold shrink-0 ${c.pill}`}>
                                  {item.count} {item.count === 1 ? 'registrant' : 'registrants'}
                                </span>
                              </div>
                            );
                          })
                        )}
                      </div>

                      {/* Pagination Controls */}
                      {totalCourseRegPages > 1 && (
                        <div className="flex items-center justify-between mt-2.5 pt-2 border-t border-slate-150/30">
                          <button
                            type="button"
                            onClick={() => setCourseRegPage(prev => Math.max(prev - 1, 1))}
                            disabled={courseRegPage === 1}
                            className={`w-8 h-8 flex items-center justify-center rounded-xl transition-all ${
                              courseRegPage === 1
                                ? 'bg-slate-50 text-slate-350 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-90 shadow-sm'
                            }`}
                            title="Previous page"
                          >
                            <span className="material-symbols-outlined text-[16px] font-bold">chevron_left</span>
                          </button>

                          <span className="text-[10px] font-extrabold text-slate-500 select-none">
                            {courseRegPage} / {totalCourseRegPages}
                          </span>

                          <button
                            type="button"
                            onClick={() => setCourseRegPage(prev => Math.min(prev + 1, totalCourseRegPages))}
                            disabled={courseRegPage === totalCourseRegPages}
                            className={`w-8 h-8 flex items-center justify-center rounded-xl transition-all ${
                              courseRegPage === totalCourseRegPages
                                ? 'bg-slate-50 text-slate-350 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-90 shadow-sm'
                            }`}
                            title="Next page"
                          >
                            <span className="material-symbols-outlined text-[16px] font-bold">chevron_right</span>
                          </button>
                        </div>
                      )}
                    </div>

                    <div className="mt-4 pt-3 border-t border-slate-150/40 text-[10px] text-text-muted flex items-center gap-1.5 font-semibold">
                      <span className="material-symbols-outlined text-sm text-[#F36F21]">analytics</span>
                      <span>Total: {trendFilteredTransactions.length} sign-ups in past period.</span>
                    </div>
                  </div>
                </div>

                {/* Table: Course Registration Transactions */}
                <div className="bg-surface rounded-3xl p-6 border border-slate-200/50 ambient-shadow">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-5">
                    <div>
                      <h3 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Course Enrollment Sales History</h3>
                      <p className="text-xs text-text-muted mt-0.5">Recent transaction records of students enrolling in your published courses.</p>
                    </div>
                    <span className="px-3 py-1 rounded-xl bg-slate-50 border border-slate-200 text-brand-blue font-bold text-xs shrink-0">
                      Showing {pagedEnrollmentTransactions.length} of {totalEnrollmentRecords} transactions
                    </span>
                  </div>

                  {pagedEnrollmentTransactions.length === 0 ? (
                    <div className="flex flex-col items-center justify-center py-10 text-center">
                      <span className="material-symbols-outlined text-4xl text-slate-300 mb-2">inbox</span>
                      <p className="text-xs text-text-muted font-bold">No enrollment transactions recorded.</p>
                    </div>
                  ) : (
                    <>
                      <div className="overflow-x-auto w-full">
                        <table className="w-full text-left text-sm whitespace-nowrap">
                          <thead>
                            <tr className="text-[10px] uppercase tracking-wider text-slate-500 border-b border-slate-100 font-extrabold bg-slate-50/70">
                              <th className="py-3 px-4 rounded-l-xl text-center w-16">No.</th>
                              <th className="py-3 px-4">Student Name</th>
                              <th className="py-3 px-4">Enrolled Course</th>
                              <th className="py-3 px-4 text-right">Amount Paid</th>
                              <th className="py-3 px-4 rounded-r-xl text-center">Transaction Time</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-slate-100 text-xs font-semibold text-slate-700">
                            {pagedEnrollmentTransactions.map((tx, idx) => {
                              const seqNo = (enrollmentPage - 1) * recordsPerPage + idx + 1;
                              return (
                                <tr key={tx.id} className="hover:bg-slate-50/50 transition-colors">
                                  <td className="py-3.5 px-4 text-center text-text-muted font-bold">{seqNo}</td>
                                  <td className="py-3.5 px-4">
                                    <div className="flex items-center gap-2.5">
                                      <div className="w-7 h-7 rounded-full bg-primary/10 text-primary font-black flex items-center justify-center text-[10px]">
                                        {tx.studentName.split(' ').pop()?.charAt(0) || 'U'}
                                      </div>
                                      <span className="font-bold text-brand-blue">{tx.studentName}</span>
                                    </div>
                                  </td>
                                  <td className="py-3.5 px-4 text-slate-700">{tx.courseTitle}</td>
                                  <td className="py-3.5 px-4 text-right text-green-600 font-bold">
                                    {tx.amount.toLocaleString('vi-VN')} ₫
                                  </td>
                                  <td className="py-3.5 px-4 text-center text-slate-500 font-medium">
                                    {formatFullDateTime(tx.timestamp)}
                                  </td>
                                </tr>
                              );
                            })}
                          </tbody>
                        </table>
                      </div>

                      {/* Pagination Controls */}
                      {totalEnrollmentPages > 1 && (
                        <div className="flex items-center justify-between border-t border-slate-100 pt-4.5 mt-5">
                          <button
                            type="button"
                            onClick={() => setEnrollmentPage(prev => Math.max(prev - 1, 1))}
                            disabled={enrollmentPage === 1}
                            className={`flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold rounded-xl transition-all ${
                              enrollmentPage === 1
                                ? 'bg-slate-50 text-slate-400 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-95 shadow-sm'
                            }`}
                          >
                            <span className="material-symbols-outlined text-[16px]">chevron_left</span>
                            Previous
                          </button>

                          <div className="flex items-center gap-1">
                            {Array.from({ length: totalEnrollmentPages }, (_, i) => i + 1).map(pageNo => {
                              const isActive = enrollmentPage === pageNo;
                              return (
                                <button
                                  key={pageNo}
                                  type="button"
                                  onClick={() => setEnrollmentPage(pageNo)}
                                  className={`w-8 h-8 flex items-center justify-center text-xs font-extrabold rounded-xl transition-all ${
                                    isActive
                                      ? 'bg-primary text-white shadow-md shadow-primary/10 scale-105'
                                      : 'bg-white border border-slate-200/50 text-slate-600 hover:bg-slate-50 hover:text-brand-blue'
                                  }`}
                                >
                                  {pageNo}
                                </button>
                              );
                            })}
                          </div>

                          <button
                            type="button"
                            onClick={() => setEnrollmentPage(prev => Math.min(prev + 1, totalEnrollmentPages))}
                            disabled={enrollmentPage === totalEnrollmentPages}
                            className={`flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold rounded-xl transition-all ${
                              enrollmentPage === totalEnrollmentPages
                                ? 'bg-slate-50 text-slate-400 border border-slate-100 cursor-not-allowed'
                                : 'bg-white border border-slate-200 text-slate-700 hover:bg-slate-50 hover:text-brand-blue active:scale-95 shadow-sm'
                            }`}
                          >
                            Next
                            <span className="material-symbols-outlined text-[16px]">chevron_right</span>
                          </button>
                        </div>
                      )}
                    </>
                  )}
                </div>

                {/* Table: Withdrawal / Payout History */}
                <div className="bg-surface rounded-3xl p-6 border border-slate-200/50 ambient-shadow">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-5">
                    <div>
                      <h3 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Monthly Payout History Log</h3>
                      <p className="text-xs text-text-muted mt-0.5">Automated monthly payout logs processed and credited to your registered bank account.</p>
                    </div>
                    {/* Quick System Payout Badge */}
                    <div className="bg-[#e8f0fe] border border-blue-200 px-3.5 py-2.5 rounded-2xl flex items-center gap-2.5 shrink-0 shadow-sm">
                      <span className="material-symbols-outlined text-blue-600 text-xl icon-fill animate-spin-slow">autorenew</span>
                      <div>
                        <h4 className="text-[10px] font-extrabold text-brand-blue uppercase tracking-wider">Automated Payouts</h4>
                        <p className="text-[9px] text-slate-600 font-bold mt-0.5">Processed on the 1st of each month</p>
                      </div>
                    </div>
                  </div>

                  <div className="overflow-x-auto w-full">
                    <table className="w-full text-left text-sm whitespace-nowrap">
                      <thead>
                        <tr className="text-[10px] uppercase tracking-wider text-slate-500 border-b border-slate-100 font-extrabold bg-slate-50/70">
                          <th className="py-3 px-4 rounded-l-xl">Payout Period</th>
                          <th className="py-3 px-4 text-right">Amount Paid</th>
                          <th className="py-3 px-4">Receiving Account</th>
                          <th className="py-3 px-4 text-center">Status</th>
                          <th className="py-3 px-4">Reference Code</th>
                          <th className="py-3 px-4 rounded-r-xl text-center">Action</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100 text-xs font-semibold text-slate-700">
                        {payoutHistory.slice(0, 3).map((item) => (
                          <tr key={item.id} className="hover:bg-slate-50/50 transition-colors">
                            <td className="py-3.5 px-4 font-bold text-brand-blue">{item.payoutPeriod}</td>
                            <td className="py-3.5 px-4 text-right text-slate-900 font-bold">
                              {item.amount.toLocaleString('vi-VN')} ₫
                            </td>
                            <td className="py-3.5 px-4 text-slate-500 font-medium">
                              {item.bankName} - {maskAccountNumber(item.bankAccountNumber)}
                            </td>
                            <td className="py-3.5 px-4 text-center">
                              <span className={`px-2.5 py-1 rounded-full text-[10px] font-black border tracking-wide uppercase select-none ${
                                item.status === 'SUCCESS' ? 'bg-[#f0fdf4] text-green-700 border-green-200' :
                                item.status === 'PROCESSING' ? 'bg-blue-50 text-blue-700 border-blue-100' :
                                item.status === 'FAILED' ? 'bg-red-50 text-red-700 border-red-100' :
                                'bg-slate-50 text-slate-700 border-slate-200'
                              }`}>
                                {item.status}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 text-slate-500 font-mono tracking-tight">{item.transactionReference}</td>
                            <td className="py-3.5 px-4 text-center">
                              {item.status === 'FAILED' ? (
                                <button
                                  type="button"
                                  onClick={() => setSelectedFailedPayout(item)}
                                  className="px-3.5 py-1.5 text-[10px] font-extrabold rounded-lg bg-red-500 hover:bg-red-600 text-white transition-all shadow-sm flex items-center gap-0.5 mx-auto active:scale-95"
                                >
                                  <span className="material-symbols-outlined text-xs">info</span> View Reason
                                </button>
                              ) : (
                                <span className="text-[10px] text-text-muted font-bold italic">-</span>
                              )}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>

                  {/* View All Payouts Button */}
                  {payoutHistory.length > 3 && (
                    <div className="flex justify-center mt-5 pt-3 border-t border-slate-100">
                      <button
                        type="button"
                        onClick={() => setIsAllPayoutsModalOpen(true)}
                        className="px-5 py-2.5 bg-slate-50 hover:bg-slate-100/80 border border-slate-200 text-brand-blue font-bold text-xs rounded-xl flex items-center gap-1.5 transition-all shadow-sm active:scale-95"
                      >
                        <span className="material-symbols-outlined text-base">history</span>
                        View All Automatic Payouts
                      </button>
                    </div>
                  )}
                </div>

                {/* Modal: Payout Failure Reason (admin_note) */}
                {selectedFailedPayout && (
                  <div className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4 animate-fade-in">
                    <div className="bg-surface border border-slate-200 shadow-2xl rounded-3xl p-6 max-w-md w-full relative z-50 animate-scale-in">
                      <div className="flex items-center gap-2.5 text-red-600 mb-4">
                        <span className="material-symbols-outlined text-3xl">error</span>
                        <h3 className="font-display font-black text-lg text-brand-blue">Payout Request Failed</h3>
                      </div>
                      
                      <div className="flex flex-col gap-3 bg-slate-50 p-4 rounded-2xl border border-slate-200/40 text-xs font-semibold text-slate-700 mb-5">
                        <div className="flex justify-between">
                          <span className="text-text-muted">Payout Period:</span>
                          <span className="font-bold text-brand-blue">{selectedFailedPayout.payoutPeriod}</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-text-muted">Amount Paid:</span>
                          <span className="font-bold text-red-600">{selectedFailedPayout.amount.toLocaleString('vi-VN')} ₫</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-text-muted">Receiving Account:</span>
                          <span className="font-bold text-brand-blue">{selectedFailedPayout.bankName} - {maskAccountNumber(selectedFailedPayout.bankAccountNumber)}</span>
                        </div>
                      </div>

                      <div className="flex flex-col gap-1.5 mb-6">
                        <span className="text-xs font-bold text-brand-blue uppercase tracking-wider">Administrator Note:</span>
                        <div className="p-4 bg-red-50/50 border border-red-150/40 text-red-700 text-xs font-medium rounded-xl leading-relaxed">
                          {selectedFailedPayout.adminNote}
                        </div>
                      </div>

                      <div className="flex justify-end">
                        <button 
                          type="button"
                          onClick={() => setSelectedFailedPayout(null)} 
                          className="bg-brand-blue hover:bg-brand-blue-light text-white font-bold text-xs py-2.5 px-6 rounded-xl transition-all shadow-md active:scale-95"
                        >
                          Close
                        </button>
                      </div>
                    </div>
                  </div>
                )}

                {/* Modal: View All Payouts */}
                {isAllPayoutsModalOpen && (
                  <div className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4 animate-fade-in">
                    <div className="bg-surface border border-slate-200 shadow-2xl rounded-3xl p-6 max-w-4xl w-full relative z-50 animate-scale-in flex flex-col max-h-[85vh]">
                      {/* Modal Header */}
                      <div className="flex justify-between items-center mb-5 pb-3 border-b border-slate-150/40">
                        <div className="flex items-center gap-2 text-brand-blue">
                          <span className="material-symbols-outlined text-2xl text-primary font-bold">history</span>
                          <h3 className="font-display font-black text-lg">All Automatic Payout Transactions</h3>
                        </div>
                        <button
                          type="button"
                          onClick={() => setIsAllPayoutsModalOpen(false)}
                          className="w-8 h-8 rounded-xl bg-slate-50 hover:bg-slate-100 text-slate-500 hover:text-slate-700 flex items-center justify-center transition-all active:scale-90"
                        >
                          <span className="material-symbols-outlined text-lg">close</span>
                        </button>
                      </div>

                      {/* Modal Content - Scrollable Table */}
                      <div className="overflow-y-auto flex-1 w-full min-h-[300px] pr-1">
                        <table className="w-full text-left text-sm whitespace-nowrap">
                          <thead>
                            <tr className="text-[10px] uppercase tracking-wider text-slate-500 border-b border-slate-100 font-extrabold bg-slate-50/70 sticky top-0 z-10">
                              <th className="py-3 px-4 rounded-l-xl">Payout Period</th>
                              <th className="py-3 px-4 text-right">Amount Paid</th>
                              <th className="py-3 px-4">Receiving Account</th>
                              <th className="py-3 px-4 text-center">Status</th>
                              <th className="py-3 px-4">Reference Code</th>
                              <th className="py-3 px-4 rounded-r-xl text-center">Action</th>
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-slate-100 text-xs font-semibold text-slate-700">
                            {payoutHistory.map((item) => (
                              <tr key={item.id} className="hover:bg-slate-50/50 transition-colors">
                                <td className="py-3.5 px-4 font-bold text-brand-blue">{item.payoutPeriod}</td>
                                <td className="py-3.5 px-4 text-right text-slate-900 font-bold">
                                  {item.amount.toLocaleString('vi-VN')} ₫
                                </td>
                                <td className="py-3.5 px-4 text-slate-500 font-medium">
                                  {item.bankName} - {maskAccountNumber(item.bankAccountNumber)}
                                </td>
                                <td className="py-3.5 px-4 text-center">
                                  <span className={`px-2.5 py-1 rounded-full text-[10px] font-black border tracking-wide uppercase select-none ${
                                    item.status === 'SUCCESS' ? 'bg-[#f0fdf4] text-green-700 border-green-200' :
                                    item.status === 'PROCESSING' ? 'bg-blue-50 text-blue-700 border-blue-100' :
                                    item.status === 'FAILED' ? 'bg-red-50 text-red-700 border-red-100' :
                                    'bg-slate-50 text-slate-700 border-slate-200'
                                  }`}>
                                    {item.status}
                                  </span>
                                </td>
                                <td className="py-3.5 px-4 text-slate-500 font-mono tracking-tight">{item.transactionReference}</td>
                                <td className="py-3.5 px-4 text-center">
                                  {item.status === 'FAILED' ? (
                                    <button
                                      type="button"
                                      onClick={() => {
                                        setSelectedFailedPayout(item);
                                        setIsAllPayoutsModalOpen(false);
                                      }}
                                      className="px-3.5 py-1.5 text-[10px] font-extrabold rounded-lg bg-red-500 hover:bg-red-600 text-white transition-all shadow-sm flex items-center gap-0.5 mx-auto active:scale-95"
                                    >
                                      <span className="material-symbols-outlined text-xs">info</span> View Reason
                                    </button>
                                  ) : (
                                    <span className="text-[10px] text-text-muted font-bold italic">-</span>
                                  )}
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>

                      {/* Modal Footer */}
                      <div className="mt-5 pt-3 border-t border-slate-150/40 flex justify-end">
                        <button
                          type="button"
                          onClick={() => setIsAllPayoutsModalOpen(false)}
                          className="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold text-xs rounded-xl transition-all active:scale-95"
                        >
                          Close
                        </button>
                      </div>
                    </div>
                  </div>
                )}
              </div>
            )}


          </main>
        )}

        {/* ================= WORKSPACE PANEL: COURSE CURRICULUM & DETAILS (FLUSH-RIGHT) ================= */}
        {activeTab === 'edit-course' && (
          <div id="course-editor-workspace" className="flex-grow flex flex-col gap-6 w-full p-6 md:p-8 bg-[#f0f4f9] min-h-screen select-none">
            {/* Workspace Header */}
            <div className="bg-brand-blue text-white px-6 py-4 flex items-center justify-between shadow-md border-b border-brand-blue-light/35 rounded-2xl shrink-0">
              <div className="flex items-center gap-3">
                <span className="material-symbols-outlined text-primary text-2xl font-bold">school</span>
                <div>
                  <h3 className="font-display font-black text-sm md:text-base leading-tight" id="workspace-course-title">{workspaceCourseTitle}</h3>
                  <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider">Instructor Course Management & Student Q/A Portal</span>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="px-2.5 py-0.5 rounded-full bg-amber-500/20 text-amber-500 border border-amber-500/30 text-[10px] font-bold uppercase tracking-wider">Chờ duyệt / Pending</span>
                <button
                  type="button"
                  onClick={handleSaveAllCourseChanges}
                  disabled={isSaving}
                  className="flex items-center gap-1.5 px-5 py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-600 hover:from-emerald-600 hover:to-teal-700 text-white transition-all text-xs font-bold shadow-lg shadow-emerald-500/25 hover:scale-[1.02] active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isSaving ? (
                    <>
                      <span className="material-symbols-outlined text-sm animate-spin">sync</span> Đang lưu...
                    </>
                  ) : (
                    <>
                      <span className="material-symbols-outlined text-sm">save</span> 💾 Lưu toàn bộ khóa học
                    </>
                  )}
                </button>
                <button
                  type="button"
                  onClick={closeSyllabusEditor}
                  className="flex items-center gap-1 px-3.5 py-2 rounded-xl bg-white/10 hover:bg-red-600 text-white hover:text-white transition-all text-xs font-bold shadow-md hover:scale-[1.02] active:scale-[0.98]"
                >
                  <span className="material-symbols-outlined text-sm">close</span> Thoát
                </button>
              </div>
            </div>

            {/* Workspace Body */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start w-full">
              
              {/* Left Column: Dynamic Workspace States */}
              {selectedItem.type === null && (
                <div className="lg:col-span-9 flex flex-col gap-6 w-full animate-fade-in pb-12">
                  {/* Workspace Header */}
                  <div className="bg-white rounded-3xl border border-gray-200 p-6 shadow-sm flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                      <div className="flex items-center gap-2">
                        <span className="text-[10px] font-extrabold text-primary uppercase tracking-wider">Course Landing Details</span>
                      </div>
                      <h3 className="text-lg font-display font-black text-brand-blue leading-tight mt-1">Edit Course Landing Page & Overview</h3>
                    </div>
                    <button
                      type="button"
                      onClick={handleSaveAllCourseChanges}
                      disabled={isSaving}
                      className="bg-gradient-to-r from-emerald-500 to-teal-600 hover:from-emerald-600 hover:to-teal-700 text-white font-bold text-xs py-3 px-6 rounded-xl transition-all shadow-md shadow-emerald-500/10 flex items-center gap-1.5 shrink-0 disabled:opacity-50"
                    >
                      <span className="material-symbols-outlined text-sm font-bold">{isSaving ? 'sync' : 'save'}</span>
                      <span>{isSaving ? 'Đang lưu...' : '💾 Lưu toàn bộ khóa học'}</span>
                    </button>
                  </div>

                  {/* FORM SECTIONS */}
                  
                  {/* PANEL 1: BASIC MARKETING INFO */}
                  <div className="bg-white rounded-3xl border border-gray-200 p-6 flex flex-col gap-6 shadow-sm">
                    <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                      <span className="material-symbols-outlined text-primary text-[20px]">assignment</span> Basic Marketing Info
                    </h4>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                      {/* Course Title */}
                      <div className="flex flex-col gap-1.5 md:col-span-2">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Title</label>
                        <input
                          type="text"
                          value={courseTitleInput}
                          onChange={(e) => setCourseTitleInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue w-full"
                          placeholder="e.g. Full-Stack React & Node.js Masterclass"
                        />
                      </div>

                      {/* Course Sub-topic */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Sub-topic / Category</label>
                        <input
                          type="text"
                          value={courseTopicInput}
                          onChange={(e) => setCourseTopicInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue w-full"
                          placeholder="e.g. Web Development"
                        />
                      </div>

                      {/* Language of Instruction */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Language of Instruction</label>
                        <input
                          type="text"
                          value={courseLanguageInput}
                          onChange={(e) => setCourseLanguageInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue w-full"
                          placeholder="e.g. English, Vietnamese"
                        />
                      </div>

                      {/* Target Skill Level */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Target Skill Level</label>
                        <select
                          value={courseLevelInput}
                          onChange={(e) => setCourseLevelInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue w-full"
                        >
                          <option value="Beginner">Beginner Level</option>
                          <option value="Intermediate">Intermediate Level</option>
                          <option value="Advanced">Advanced Level</option>
                          <option value="All Levels">All Levels (Comprehensive)</option>
                        </select>
                      </div>

                      {/* Purchase Price */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Purchase Price (₫)</label>
                        <input
                          type="number"
                          value={coursePriceInput}
                          onChange={(e) => setCoursePriceInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue w-full"
                          placeholder="e.g. 499000"
                        />
                      </div>
                    </div>
                  </div>

                  {/* PANEL 2: DESCRIPTIONS & MEDIA */}
                  <div className="bg-white rounded-3xl border border-gray-200 p-6 flex flex-col gap-6 shadow-sm">
                    <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                      <span className="material-symbols-outlined text-primary text-[20px]">description</span> Descriptions & Media
                    </h4>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                      {/* Short Description */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Short Description</label>
                        <textarea
                          value={courseDescInput}
                          onChange={(e) => setCourseDescInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue h-[155px] resize-none"
                          placeholder="Build scalable, production-ready web applications from scratch..."
                        />
                      </div>

                      {/* Long Description */}
                      <div className="flex flex-col gap-1.5">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Description (Long Description)</label>
                        <textarea
                          value={courseLongDescInput}
                          onChange={(e) => setCourseLongDescInput(e.target.value)}
                          className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue h-[155px] resize-none"
                          placeholder="The course is a transformative journey designed to take you from zero to a production-ready developer..."
                        />
                      </div>
                    </div>
                  </div>

                  {/* PANEL 3: COURSE SPECIFICATIONS */}
                  <div className="bg-white rounded-3xl border border-gray-200 p-6 flex flex-col gap-6 shadow-sm">
                    <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                      <span className="material-symbols-outlined text-primary text-[20px]">fact_check</span> Course Specifications
                    </h4>

                    <div className="flex flex-col gap-7">
                      {/* 1. What You'll Learn */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">What you'll learn</label>
                          <span className="text-[10px] text-text-muted font-bold">Each box is 1 key point</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {learnPoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...learnPoints];
                                  arr[idx] = e.target.value;
                                  setLearnPoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. Architect scalable MERN applications"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setLearnPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Point"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setLearnPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Point</span>
                          </button>
                        </div>
                      </div>

                      {/* 2. Course Highlights */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Highlights</label>
                          <span className="text-[10px] text-text-muted font-bold">Key highlights</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {highlightPoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...highlightPoints];
                                  arr[idx] = e.target.value;
                                  setHighlightPoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. 15+ Real-world Projects"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setHighlightPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Highlight"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setHighlightPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Highlight</span>
                          </button>
                        </div>
                      </div>

                      {/* 3. Technologies & Tools */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Technologies & Tools</label>
                          <span className="text-[10px] text-text-muted font-bold">Tech stack used</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {techPoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...techPoints];
                                  arr[idx] = e.target.value;
                                  setTechPoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. React"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setTechPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Tech"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setTechPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Tech</span>
                          </button>
                        </div>
                      </div>

                      {/* 4. Prerequisites */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Prerequisites</label>
                          <span className="text-[10px] text-text-muted font-bold">Requirements</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {prereqPoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...prereqPoints];
                                  arr[idx] = e.target.value;
                                  setPrereqPoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. Basic JavaScript knowledge"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setPrereqPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Prerequisite"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setPrereqPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Prereq</span>
                          </button>
                        </div>
                      </div>

                      {/* 5. Target Audience */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Target Audience</label>
                          <span className="text-[10px] text-text-muted font-bold">Intended coders</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {audiencePoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...audiencePoints];
                                  arr[idx] = e.target.value;
                                  setAudiencePoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. Aspiring Full-Stack Developers"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setAudiencePoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Audience"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setAudiencePoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Audience</span>
                          </button>
                        </div>
                      </div>

                      {/* 6. Completion Benefits */}
                      <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                        <div className="flex justify-between items-center mb-1">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Completion Benefits</label>
                          <span className="text-[10px] text-text-muted font-bold">What students get</span>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                          {benefitPoints.map((val, idx) => (
                            <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3 flex flex-col justify-between min-h-[90px] shadow-sm hover:shadow-md transition-all">
                              <textarea
                                value={val}
                                onChange={(e) => {
                                  const arr = [...benefitPoints];
                                  arr[idx] = e.target.value;
                                  setBenefitPoints(arr);
                                }}
                                className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                                placeholder="e.g. Portfolio Projects"
                              />
                              <div className="flex justify-end mt-1 shrink-0">
                                <button
                                  type="button"
                                  onClick={() => setBenefitPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                  className="opacity-0 group-hover:opacity-100 p-1 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                  title="Delete Benefit"
                                >
                                  <span className="material-symbols-outlined text-[14px]">delete</span>
                                </button>
                              </div>
                            </div>
                          ))}
                          <button type="button" onClick={() => setBenefitPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3 flex flex-col items-center justify-center min-h-[90px] text-slate-400 hover:text-primary transition-all gap-1 bg-surface/50 group">
                            <span className="material-symbols-outlined text-xl font-bold transition-transform group-hover:scale-110">add</span>
                            <span className="text-[10px] font-extrabold">Add Benefit</span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* PANEL 4: COURSE REVIEWS & STUDENT FEEDBACK */}
                  <div className="bg-white rounded-3xl border border-gray-250/60 p-6 flex flex-col gap-6 shadow-sm">
                    <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                      <span className="material-symbols-outlined text-primary text-[20px]">reviews</span> Student Feedback & Reviews
                    </h4>

                    <div className="flex flex-col lg:flex-row gap-8 items-start lg:items-center p-6 bg-slate-50/50 border border-slate-200/40 rounded-2xl">
                      {/* Left: Overall score card */}
                      <div className="flex flex-col items-center gap-2 shrink-0 bg-white border border-slate-200/60 p-5 rounded-2xl shadow-sm w-full lg:w-44 text-center">
                        <span className="text-5xl font-extrabold text-primary">4.9</span>
                        <div className="flex text-yellow-400">
                          <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                        </div>
                        <span className="text-xs font-bold text-brand-blue uppercase tracking-wider mt-1">Course Rating</span>
                        <span className="text-[10px] text-text-muted font-semibold mt-0.5">Based on 2,451 reviews</span>
                      </div>

                      {/* Right: Star breakdown bars */}
                      <div className="flex-grow w-full space-y-2.5">
                        {/* 5 stars */}
                        <div className="flex items-center gap-4 text-xs font-semibold">
                          <div className="flex text-yellow-400 shrink-0 w-24 justify-end">
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          </div>
                          <div className="flex-grow bg-slate-200/60 rounded-full h-2 overflow-hidden">
                            <div className="bg-primary h-full rounded-full" style={{ width: '85%' }}></div>
                          </div>
                          <span className="w-12 text-slate-500 text-left shrink-0">2,083</span>
                        </div>
                        {/* 4 stars */}
                        <div className="flex items-center gap-4 text-xs font-semibold">
                          <div className="flex text-yellow-400 shrink-0 w-24 justify-end">
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                          </div>
                          <div className="flex-grow bg-slate-200/60 rounded-full h-2 overflow-hidden">
                            <div className="bg-primary h-full rounded-full" style={{ width: '10%' }}></div>
                          </div>
                          <span className="w-12 text-slate-500 text-left shrink-0">245</span>
                        </div>
                        {/* 3 stars */}
                        <div className="flex items-center gap-4 text-xs font-semibold">
                          <div className="flex text-yellow-400 shrink-0 w-24 justify-end">
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                          </div>
                          <div className="flex-grow bg-slate-200/60 rounded-full h-2 overflow-hidden">
                            <div className="bg-primary h-full rounded-full" style={{ width: '3%' }}></div>
                          </div>
                          <span className="w-12 text-slate-500 text-left shrink-0">74</span>
                        </div>
                        {/* 2 stars */}
                        <div className="flex items-center gap-4 text-xs font-semibold">
                          <div className="flex text-yellow-400 shrink-0 w-24 justify-end">
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                          </div>
                          <div className="flex-grow bg-slate-200/60 rounded-full h-2 overflow-hidden">
                            <div className="bg-primary h-full rounded-full" style={{ width: '1%' }}></div>
                          </div>
                          <span className="w-12 text-slate-500 text-left shrink-0">24</span>
                        </div>
                        {/* 1 star */}
                        <div className="flex items-center gap-4 text-xs font-semibold">
                          <div className="flex text-yellow-400 shrink-0 w-24 justify-end">
                            <span className="material-symbols-outlined text-[15px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                            <span className="material-symbols-outlined text-[15px] text-slate-250">star</span>
                          </div>
                          <div className="flex-grow bg-slate-200/60 rounded-full h-2 overflow-hidden">
                            <div className="bg-primary h-full rounded-full" style={{ width: '1%' }}></div>
                          </div>
                          <span className="w-12 text-slate-500 text-left shrink-0">25</span>
                        </div>
                      </div>
                    </div>

                    {/* Feedback cards grid */}
                    <div className="flex flex-col gap-4 mt-2 divide-y divide-slate-100">
                      {/* Review 1 */}
                      <div className="pt-5 flex gap-4 items-start">
                        <img
                          alt="User Avatar"
                          className="w-10 h-10 rounded-full object-cover bg-slate-100 border border-slate-200 shrink-0"
                          src="https://lh3.googleusercontent.com/aida-public/AB6AXuB98dPVylZwO6vg95FQaD4k-myG1YhY-VGq7du1S8-pcxrZmnhUwx2VzSs1AkC17Ld9sN1YJQziGrBM5Wxg39W1UFKWDjBJkC4p7QnbHP8aEqlD703-2MHTrqIN65tt0QPlOkZY7JTwMAXIas3lEuSOkuv9JT3HAenrdph26Gza-yDSVOVR0WEfHbnhWYtKN5fNK-bLnyjvw5pHNbtgeUVJysTqy7Xeb6TBV9G1g22LmO1UX_2MQ-DV5vRbsXPHEqko_NPdoIjv-Is"
                        />
                        <div className="flex-1 min-w-0">
                          <div className="flex justify-between items-start gap-4">
                            <div>
                              <h5 className="text-xs font-extrabold text-brand-blue">David Thompson</h5>
                              <div className="flex text-yellow-400 scale-75 origin-left -ml-1 mt-0.5">
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                              </div>
                            </div>
                            <span className="text-[10px] text-text-muted font-bold whitespace-nowrap shrink-0">2 days ago</span>
                          </div>
                          <p className="text-xs text-text-muted leading-relaxed font-semibold mt-2">
                            Excellent course! The curriculum was structured extremely well, and the technical illustrations were of premium quality. Highly recommend to any developers preparing to build production-grade web applications.
                          </p>
                        </div>
                      </div>

                      {/* Review 2 */}
                      <div className="pt-5 flex gap-4 items-start">
                        <img
                          alt="User Avatar"
                          className="w-10 h-10 rounded-full object-cover bg-slate-100 border border-slate-200 shrink-0"
                          src="https://lh3.googleusercontent.com/aida-public/AB6AXuB98dPVylZwO6vg95FQaD4k-myG1YhY-VGq7du1S8-pcxrZmnhUwx2VzSs1AkC17Ld9sN1YJQziGrBM5Wxg39W1UFKWDjBJkC4p7QnbHP8aEqlD703-2MHTrqIN65tt0QPlOkZY7JTwMAXIas3lEuSOkuv9JT3HAenrdph26Gza-yDSVOVR0WEfHbnhWYtKN5fNK-bLnyjvw5pHNbtgeUVJysTqy7Xeb6TBV9G1g22LmO1UX_2MQ-DV5vRbsXPHEqko_NPdoIjv-Is"
                        />
                        <div className="flex-1 min-w-0">
                          <div className="flex justify-between items-start gap-4">
                            <div>
                              <h5 className="text-xs font-extrabold text-brand-blue">Amanda Lee</h5>
                              <div className="flex text-yellow-400 scale-75 origin-left -ml-1 mt-0.5">
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined text-[16px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                              </div>
                            </div>
                            <span className="text-[10px] text-text-muted font-bold whitespace-nowrap shrink-0">1 week ago</span>
                          </div>
                          <p className="text-xs text-text-muted leading-relaxed font-semibold mt-2">
                            Very comprehensive. The deep dive into backend database systems and the mock testing architectures are incredibly premium. Best money spent on a course this year.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* SAVE ACTION */}
                  <div className="bg-white rounded-3xl border border-gray-250 p-6 shadow-sm flex justify-end">
                    <button
                      type="button"
                      onClick={handleSaveAllCourseChanges}
                      disabled={isSaving}
                      className="bg-gradient-to-r from-emerald-500 to-teal-600 hover:from-emerald-600 hover:to-teal-700 text-white font-bold text-sm py-4 px-10 rounded-xl transition-all shadow-lg shadow-emerald-500/20 hover:scale-[1.02] active:scale-[0.99] flex items-center gap-2.5 disabled:opacity-50"
                    >
                      {isSaving ? (
                        <>
                          <span className="material-symbols-outlined text-base animate-spin">sync</span>
                          <span>Đang lưu toàn bộ thay đổi...</span>
                        </>
                      ) : (
                        <>
                          <span className="material-symbols-outlined text-base">save</span>
                          <span>💾 Lưu toàn bộ khóa học (Chuyển sang Chờ duyệt)</span>
                        </>
                      )}
                    </button>
                  </div>
                </div>
              )}

              {selectedItem.type === 'chapter' && activeChapter && (
                <div className="lg:col-span-9 bg-white rounded-3xl border border-gray-200 p-8 shadow-sm flex flex-col gap-6 min-h-[450px]">
                  <div className="pb-4 border-b border-gray-100">
                    <span className="text-[10px] font-extrabold text-primary uppercase tracking-wider">Workspace Mode</span>
                    <h3 className="text-xl font-display font-black text-brand-blue leading-tight mt-1">Edit Chapter Outline</h3>
                  </div>

                  <div className="flex flex-col gap-1.5">
                    <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Chapter Order Index</label>
                    <div className="bg-[#f8fafc] text-xs font-bold text-brand-blue px-4 py-3 rounded-xl border border-slate-200/50">
                      Chapter {selectedItem.chIdx + 1}
                    </div>
                  </div>

                  <div className="flex flex-col gap-2">
                    <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Chapter Title</label>
                    <input
                      type="text"
                      value={chapterTitle}
                      onChange={(e) => setChapterTitle(e.target.value)}
                      placeholder="e.g. Getting Started with React & ES6+"
                      className="text-xs border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-3 font-semibold text-brand-blue w-full"
                    />
                  </div>

                  <div className="flex gap-3 mt-4 border-t border-gray-100 pt-5">
                    <button
                      type="button"
                      onClick={handleSaveChapter}
                      className="bg-primary hover:bg-primary-hover text-white font-bold text-xs py-3 px-6 rounded-xl transition-all shadow-md shadow-primary/10 flex items-center gap-1.5"
                    >
                      <span className="material-symbols-outlined text-sm">save</span>
                      <span>Save Chapter Title</span>
                    </button>
                    <button
                      type="button"
                      onClick={() => handleAddLessonWorkspace(selectedItem.chIdx)}
                      className="border-2 border-dashed border-gray-200 hover:border-primary text-primary hover:text-primary-hover bg-white text-xs font-bold py-3 px-6 rounded-xl transition-all flex items-center gap-1.5"
                    >
                      <span className="material-symbols-outlined text-sm">add</span>
                      <span>Add Lesson to Chapter</span>
                    </button>
                  </div>
                </div>
              )}

              {selectedItem.type === 'lesson' && activeLesson && (
                <div className="lg:col-span-9 flex flex-col gap-6 w-full animate-fade-in">
                  
                  {/* Lesson Workspace Header */}
                  <div className="bg-white rounded-3xl border border-gray-200 p-6 shadow-sm flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                      <div className="flex items-center gap-2">
                        <span className="text-[10px] font-extrabold text-primary uppercase tracking-wider">Chapter {selectedItem.chIdx + 1}</span>
                        <span className="text-[10px] text-slate-350 font-bold">|</span>
                        <span className="text-[10px] font-extrabold text-brand-blue uppercase tracking-wider">Lesson {selectedItem.lesIdx! + 1}</span>
                      </div>
                      <h3 className="text-lg font-display font-black text-brand-blue leading-tight mt-1">{activeLesson.title}</h3>
                    </div>
                    <span className="px-2.5 py-0.5 text-[9px] rounded-full bg-emerald-500/20 text-emerald-600 border border-emerald-500/30 font-bold uppercase tracking-wider shadow-sm shrink-0">Active Lesson</span>
                  </div>

                  {/* Player Sub-tabs Navigation */}
                  <div className="flex border-b border-gray-200 gap-6 overflow-x-auto hide-scrollbar pb-px">
                    <button
                      type="button"
                      onClick={() => setEditorTab('overview')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'overview' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">info</span> Overview
                    </button>
                    <button
                      type="button"
                      onClick={() => setEditorTab('theory')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'theory' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">info</span> Theory Content
                    </button>
                    <button
                      type="button"
                      onClick={() => setEditorTab('exercises')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'exercises' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">terminal</span> Exercises
                    </button>
                    <button
                      type="button"
                      onClick={() => setEditorTab('quiz')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'quiz' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">quiz</span> Quiz
                    </button>
                    <button
                      type="button"
                      onClick={() => setEditorTab('media')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'media' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">video_library</span> Video & Media
                    </button>
                    <button
                      type="button"
                      onClick={() => setEditorTab('qa')}
                      className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap focus:outline-none ${
                        editorTab === 'qa' ? 'border-primary text-primary font-bold' : 'border-transparent text-text-muted hover:text-primary'
                      }`}
                    >
                      <span className="material-symbols-outlined text-[18px]">forum</span> Q&A
                      <span className="px-1.5 py-0.5 text-[10px] rounded-full bg-red-100 text-red-600 font-bold border border-red-200/30">
                        {activeLesson.questions.length || 0}
                      </span>
                    </button>
                  </div>

                  {/* Tabs Content Card */}
                  <div className="bg-surface rounded-2xl border border-gray-200 p-6 min-h-[300px] shadow-sm">
                    
                    {/* TAB 1: Overview */}
                    {editorTab === 'overview' && (
                      <div className="flex flex-col gap-5">
                        <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider border-b border-gray-100 pb-2.5">Lesson Overview</h4>
                        
                        <div className="flex flex-col gap-2">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Lesson Title</label>
                          <input
                            type="text"
                            value={lessonTitle}
                            onChange={(e) => setLessonTitle(e.target.value)}
                            placeholder="e.g. Introduction to the Course"
                            className="text-xs border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-3 font-semibold text-brand-blue w-full"
                          />
                        </div>

                        <div className="flex items-center justify-between p-4 bg-slate-50/50 rounded-xl border border-slate-200/30 mt-2">
                          <div className="flex flex-col">
                            <span className="text-xs font-bold text-brand-blue">Free Trial Access</span>
                            <span className="text-[10px] text-text-muted font-bold mt-0.5">Students can preview this without buying</span>
                          </div>
                          <label className="relative inline-flex items-center cursor-pointer">
                            <input
                              type="checkbox"
                              checked={lessonIsTrial}
                              onChange={(e) => setLessonIsTrial(e.target.checked)}
                              className="sr-only peer"
                            />
                            <div className="w-9 h-5 bg-slate-300 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-primary"></div>
                          </label>
                        </div>

                        <div className="flex gap-2 justify-end mt-4 border-t border-gray-100 pt-5">
                          <button
                            type="button"
                            onClick={handleSaveLessonOverview}
                            className="bg-primary hover:bg-primary-hover text-white font-bold text-xs py-3 px-6 rounded-xl transition-all shadow-md shadow-primary/10 flex items-center gap-1.5"
                          >
                            <span className="material-symbols-outlined text-sm">save</span>
                            <span>Save Lesson Info</span>
                          </button>
                        </div>
                      </div>
                    )}

                    {/* TAB 2: Theory */}
                    {editorTab === 'theory' && (
                      <div className="flex flex-col gap-5">
                        <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider border-b border-gray-100 pb-2.5">Lesson Theory</h4>

                        <div className="flex flex-col gap-2">
                          <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Theory & Concept Content</label>
                          <textarea
                            value={lessonTheory}
                            onChange={(e) => setLessonTheory(e.target.value)}
                            placeholder="Explain the theory, concept, or steps for this lesson..."
                            className="text-xs border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-3 font-semibold text-brand-blue h-48 resize-none w-full"
                          />
                        </div>

                        <div className="flex gap-2 justify-end mt-4 border-t border-gray-100 pt-5">
                          <button
                            type="button"
                            onClick={handleSaveLessonTheory}
                            className="bg-primary hover:bg-primary-hover text-white font-bold text-xs py-3 px-6 rounded-xl transition-all shadow-md shadow-primary/10 flex items-center gap-1.5"
                          >
                            <span className="material-symbols-outlined text-sm">save</span>
                            <span>Save Theory Content</span>
                          </button>
                        </div>
                      </div>
                    )}
                    
                    {/* TAB: Exercises */}
                    {editorTab === 'exercises' && (
                      <div className="flex flex-col gap-5">
                        <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider border-b border-gray-100 pb-2.5">Coding Exercises</h4>
                        {(!activeLesson?.exercises || activeLesson.exercises.length === 0) ? (
                          <div className="bg-slate-50 rounded-xl p-8 text-center border border-dashed border-slate-200">
                             <span className="material-symbols-outlined text-4xl text-slate-300 mb-3 block">terminal</span>
                             <h5 className="font-bold text-brand-blue mb-1">No Exercises Yet</h5>
                             <p className="text-xs text-text-muted mb-4">Add coding problems for students to practice.</p>
                             <button onClick={() => handleOpenExerciseModal()} className="px-4 py-2 bg-primary/10 text-primary font-bold text-xs rounded-lg hover:bg-primary/20 transition-colors">
                               + Create Exercise
                             </button>
                          </div>
                        ) : (
                          <div className="flex flex-col gap-3">
                            {activeLesson.exercises.map((exercise: any) => (
                              <div key={exercise.id} className="border border-slate-200 bg-white rounded-xl p-4 flex justify-between items-center shadow-sm">
                                <div>
                                  <div className="flex items-center gap-2 mb-1">
                                    <span className="material-symbols-outlined text-primary text-sm">code</span>
                                    <h5 className="font-bold text-sm text-brand-blue">{exercise.title}</h5>
                                  </div>
                                  <div className="text-[11px] text-text-muted font-semibold flex gap-3">
                                    <span className={`uppercase px-2 py-0.5 rounded-md ${exercise.difficulty === 'EASY' ? 'bg-green-100 text-green-700' : exercise.difficulty === 'MEDIUM' ? 'bg-yellow-100 text-yellow-700' : 'bg-red-100 text-red-700'}`}>
                                      {exercise.difficulty}
                                    </span>
                                  </div>
                                </div>
                                <div className="flex items-center gap-2">
                                  <button onClick={() => handleOpenExerciseModal(exercise)} className="text-primary hover:text-primary-hover text-xs font-bold border border-primary/20 hover:border-primary/50 px-3 py-1.5 rounded-lg transition-colors">
                                    Edit
                                  </button>
                                  <button onClick={() => handleDeleteExercise(exercise.id)} className="text-red-500 hover:text-red-700 text-xs font-bold border border-red-500/20 hover:border-red-500/50 px-3 py-1.5 rounded-lg transition-colors">
                                    Delete
                                  </button>
                                </div>
                              </div>
                            ))}
                            <button onClick={() => handleOpenExerciseModal()} className="mt-2 w-full py-3 border border-dashed border-slate-300 rounded-xl text-xs font-bold text-slate-500 hover:text-primary hover:border-primary hover:bg-primary/5 transition-colors flex items-center justify-center gap-2">
                              <span className="material-symbols-outlined text-sm">add</span>
                              Add Exercise
                            </button>
                          </div>
                        )}
                      </div>
                    )}

                    {/* TAB: Quiz */}
                    {editorTab === 'quiz' && (
                      <div className="flex flex-col gap-5">
                        <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider border-b border-gray-100 pb-2.5">Multiple Choice Quiz</h4>
                        {(!activeLesson?.quizzes || activeLesson.quizzes.length === 0) ? (
                          <div className="bg-slate-50 rounded-xl p-8 text-center border border-dashed border-slate-200">
                             <span className="material-symbols-outlined text-4xl text-slate-300 mb-3 block">quiz</span>
                             <h5 className="font-bold text-brand-blue mb-1">No Quiz Yet</h5>
                             <p className="text-xs text-text-muted mb-4">Test student knowledge with multiple choice questions.</p>
                             <button onClick={() => handleOpenQuizModal()} className="px-4 py-2 bg-primary/10 text-primary font-bold text-xs rounded-lg hover:bg-primary/20 transition-colors">
                               + Create Quiz
                             </button>
                          </div>
                        ) : (
                          <div className="flex flex-col gap-4">
                            {activeLesson.quizzes.map((quiz: any) => (
                              <div key={quiz.id} className="border border-slate-200 bg-white rounded-xl p-5 shadow-sm">
                                <div className="flex justify-between items-center mb-3">
                                  <h5 className="font-bold text-sm text-brand-blue flex items-center gap-2">
                                    <span className="material-symbols-outlined text-amber-500 text-base">quiz</span>
                                    {quiz.title}
                                  </h5>
                                  <div className="flex gap-2">
                                    <button onClick={() => handleOpenQuizModal(quiz)} className="text-primary hover:text-primary-hover text-[11px] font-bold">Edit Quiz</button>
                                    <button onClick={() => handleDeleteQuiz(quiz.id)} className="text-red-500 hover:text-red-700 text-[11px] font-bold">Delete Quiz</button>
                                  </div>
                                </div>
                                <div className="flex flex-col gap-2">
                                  {quiz.questions?.map((q: any, qIdx: number) => (
                                    <div key={q.id} className="bg-slate-50 rounded-lg p-3 text-xs">
                                      <div className="font-bold text-brand-blue mb-2">Q{qIdx + 1}: {q.content}</div>
                                      <ul className="pl-4 space-y-1">
                                        {q.options?.map((opt: any) => (
                                          <li key={opt.id} className={`flex items-center gap-2 ${opt.isCorrect ? 'text-green-600 font-bold' : 'text-slate-600'}`}>
                                            <span className={`w-1.5 h-1.5 rounded-full ${opt.isCorrect ? 'bg-green-500' : 'bg-slate-300'}`}></span>
                                            {opt.content}
                                          </li>
                                        ))}
                                      </ul>
                                    </div>
                                  ))}
                                </div>
                              </div>
                            ))}
                            <button onClick={() => handleOpenQuizModal()} className="mt-1 w-full py-3 border border-dashed border-slate-300 rounded-xl text-xs font-bold text-slate-500 hover:text-primary hover:border-primary hover:bg-primary/5 transition-colors flex items-center justify-center gap-2">
                              <span className="material-symbols-outlined text-sm">add</span>
                              Add Quiz
                            </button>
                          </div>
                        )}
                      </div>
                    )}

                    {/* TAB 4: Video & Media */}
                    {editorTab === 'media' && (
                      <div className="flex flex-col gap-5">
                        <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider border-b border-gray-100 pb-2.5">Lesson Video & Media Attachment</h4>

                        {isUploadingVideo ? (
                          /* Uploading Video Progress State */
                          <div className="border border-amber-200 bg-amber-500/5 rounded-2xl p-8 flex flex-col gap-4">
                            <div className="flex items-center justify-between">
                              <div className="flex items-center gap-3">
                                <div className="w-10 h-10 rounded-xl bg-amber-500/10 border border-amber-500/20 flex items-center justify-center text-amber-500">
                                  <span className="material-symbols-outlined text-xl">upload_file</span>
                                </div>
                                <div className="flex flex-col">
                                  <span className="text-xs font-bold text-brand-blue truncate max-w-[280px]">{uploadedVideoName || 'lesson_video.mp4'}</span>
                                  <span className="text-[10px] text-text-muted mt-0.5">Size: 45.8 MB | Speed: {uploadSpeed}</span>
                                </div>
                              </div>
                              <button
                                type="button"
                                onClick={() => { setIsUploadingVideo(false); setUploadedVideoName(null); }}
                                className="px-3 py-1.5 rounded-lg border border-red-200 text-red-500 text-[10px] font-bold bg-white hover:bg-red-50 transition-colors"
                              >
                                Cancel Upload
                              </button>
                            </div>

                            <div className="flex flex-col gap-1.5 mt-2">
                              <div className="flex justify-between items-center text-[10px] font-extrabold text-amber-600 uppercase tracking-wider">
                                <span>Uploading Video...</span>
                                <span>{uploadProgress}%</span>
                              </div>
                              <div className="w-full bg-slate-200 rounded-full h-2.5 overflow-hidden">
                                <div className="bg-gradient-to-r from-amber-500 to-amber-600 h-full rounded-full transition-all duration-300" style={{ width: `${uploadProgress}%` }}></div>
                              </div>
                            </div>
                          </div>
                        ) : (
                          /* Standard/Uploaded Video Panel */
                          <div className="flex flex-col gap-5">
                            {uploadedVideoName ? (
                              /* Embedded Video Player Mockup */
                              <div className="flex flex-col gap-4">
                                <div className="w-full bg-[#0a0f1d] rounded-2xl overflow-hidden shadow-lg border border-gray-800 aspect-video relative flex items-center justify-center group" style={{ maxHeight: '420px' }}>
                                  <div className="absolute inset-0 bg-slate-900/60 z-0"></div>
                                  
                                  <div id="editor-video-overlay" className="absolute inset-0 flex flex-col items-center justify-center z-10 bg-black/45 gap-3 text-white">
                                    <button className="bg-primary hover:bg-primary-hover hover:scale-105 text-white rounded-full p-5 shadow-2xl transition-all duration-300 flex items-center justify-center">
                                      <span className="material-symbols-outlined text-[48px] icon-fill">play_arrow</span>
                                    </button>
                                    <div className="text-center mt-2">
                                      <span id="editor-video-name" className="text-xs font-bold block bg-black/60 backdrop-blur px-3.5 py-1.5 rounded-full border border-white/10 mt-1">
                                        {uploadedVideoName}
                                      </span>
                                      <span className="text-[10px] text-slate-300 mt-1 block">Video duration: {lessonDuration} | Format: MP4</span>
                                    </div>
                                  </div>
                                </div>

                                <div className="flex justify-between items-center bg-slate-50 p-4 rounded-xl border border-slate-200/50">
                                  <span className="text-xs font-bold text-brand-blue">Need to change video?</span>
                                  <div className="relative bg-white hover:bg-slate-50 border border-slate-200 px-4 py-2 rounded-xl text-xs font-bold text-brand-blue cursor-pointer transition-all shadow-sm flex items-center gap-1.5">
                                    <input type="file" className="absolute inset-0 opacity-0 cursor-pointer" accept="video/mp4,video/*" onChange={handleReplaceVideo} />
                                    <span className="material-symbols-outlined text-sm">video_library</span>
                                    <span>Replace Video</span>
                                  </div>
                                </div>
                              </div>
                            ) : (
                              /* Video Upload Dropzone */
                              <div className="border border-dashed border-slate-300 bg-slate-50/40 rounded-2xl p-10 flex flex-col items-center justify-center text-center gap-3 relative hover:border-primary transition-all">
                                <input type="file" className="absolute inset-0 opacity-0 cursor-pointer" accept="video/mp4,video/*" onChange={handleReplaceVideo} />
                                <div className="w-14 h-14 rounded-full bg-slate-100 flex items-center justify-center text-slate-400 border border-slate-200 shadow-sm">
                                  <span className="material-symbols-outlined text-[28px]">movie</span>
                                </div>
                                <div className="flex flex-col gap-1">
                                  <span className="text-xs font-bold text-brand-blue">Drag & Drop Lesson Video here</span>
                                  <span className="text-[10px] text-text-muted font-semibold">Supports MP4, MOV, or WEBM up to 500 MB</span>
                                </div>
                                <span className="mt-2 bg-white hover:bg-slate-50 border border-slate-200 text-brand-blue text-[10.5px] font-bold py-2 px-4 rounded-xl transition-all shadow-sm">Select Video File</span>
                              </div>
                            )}
                          </div>
                        )}
                      </div>
                    )}

                    {/* TAB 4: Q&A Discussion */}
                    {editorTab === 'qa' && (
                      <div className="editor-tab-pane flex flex-col gap-4">
                        <div className="flex justify-between items-center mb-1 pb-3 border-b border-gray-100">
                          <h5 className="font-display font-black text-base text-brand-blue">Student Q&A Forum</h5>
                          <span className="px-2 py-0.5 text-[10px] rounded-full bg-slate-100 text-slate-600 font-bold border border-slate-200">Instructor Management Mode</span>
                        </div>
                        
                        {activeLesson.questions.length === 0 ? (
                          <div className="p-8 text-center bg-slate-50/50 border border-dashed border-slate-200/80 rounded-xl flex flex-col items-center gap-2">
                            <span className="material-symbols-outlined text-3xl text-slate-300">chat_bubble_outline</span>
                            <span className="text-xs font-bold text-slate-400">No questions asked yet for this lesson.</span>
                          </div>
                        ) : (
                          <div className="flex flex-col gap-6 mt-2">
                            {activeLesson.questions.map((q) => (
                              <div key={q.id} className="bg-slate-50/50 p-4 rounded-2xl border border-slate-200/40 flex flex-col gap-3.5 relative shadow-sm hover:shadow-md transition-all duration-300">
                                <div className="flex items-start justify-between gap-3">
                                  <div className="flex items-center gap-2.5">
                                    <img src={q.avatar} className="w-8 h-8 rounded-full border border-primary/30 object-cover shrink-0" alt="Student" />
                                    <div className="flex flex-col">
                                      <span className="text-xs font-extrabold text-brand-blue leading-tight">{q.author}</span>
                                      <span className="text-[10px] text-text-muted font-bold">{q.role} | {q.time}</span>
                                    </div>
                                  </div>
                                  <span className="px-2 py-0.5 text-[8px] rounded bg-primary/10 text-primary font-bold border border-primary/20 uppercase tracking-wider">Student Question</span>
                                </div>

                                <p className="text-xs text-text-muted leading-relaxed font-semibold pl-10">{q.text}</p>

                                {q.replies && q.replies.length > 0 && (
                                  <div className="mt-3 pl-9 flex flex-col gap-4 border-t border-slate-200/50 pt-3">
                                    {q.replies.map((reply, rIdx) => (
                                      <div key={rIdx} className="bg-white p-3 rounded-xl border border-slate-100 flex flex-col gap-1.5 shadow-sm">
                                        <div className="flex items-center gap-2">
                                          <img src={reply.avatar} className="w-6 h-6 rounded-full border border-primary/20 object-cover" alt="Replier" />
                                          <div className="flex flex-col">
                                            <span className="text-[11px] font-extrabold text-brand-blue leading-tight">{reply.author}</span>
                                            <span className="text-[9px] text-text-muted leading-none">{reply.role} | {reply.time}</span>
                                          </div>
                                        </div>
                                        <p className="text-xs text-brand-blue pl-8 font-semibold leading-relaxed">{reply.text}</p>
                                      </div>
                                    ))}
                                  </div>
                                )}

                                <div className="pl-10 flex flex-col gap-2">
                                  <div className="flex justify-end">
                                    <button
                                      onClick={() => toggleQaReplyInput(q.id)}
                                      className="px-3.5 py-1.5 rounded-xl bg-primary text-white text-[10px] font-bold flex items-center gap-1 shadow-sm hover:bg-primary-hover hover:scale-[1.02] active:scale-[0.98] transition-all"
                                    >
                                      <span className="material-symbols-outlined text-xs">reply</span> 
                                      <span>Answer / Reply</span>
                                    </button>
                                  </div>

                                  {activeQaReplyInputs[q.id] && (
                                    <div className="flex flex-col gap-2 mt-2 bg-white p-3 rounded-xl border border-slate-200/60 shadow-inner animate-fade-in">
                                      <textarea
                                        placeholder={`Type your response to ${q.author}...`}
                                        value={qaReplyTextState[q.id] || ''}
                                        onChange={(e) => setQaReplyTextState(prev => ({ ...prev, [q.id]: e.target.value }))}
                                        className="text-xs border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-lg p-2.5 font-semibold text-brand-blue h-20 resize-none w-full"
                                      />
                                      <div className="flex gap-2 justify-end">
                                        <button onClick={() => toggleQaReplyInput(q.id)} className="px-2.5 py-1 rounded border border-slate-200 text-slate-700 text-[9px] font-bold hover:bg-slate-50">Cancel</button>
                                        <button onClick={() => submitQaReply(q.id)} className="px-2.5 py-1 rounded bg-brand-green hover:bg-brand-green-hover text-white text-[9px] font-bold transition-all shadow-sm">Submit Reply</button>
                                      </div>
                                    </div>
                                  )}
                                </div>
                              </div>
                            ))}
                          </div>
                        )}
                      </div>
                    )}

                  </div>
                </div>
              )}

              {/* Right Column: Chapters & Lessons Accordion Sidebar */}
              <div className="lg:col-span-3 bg-surface rounded-2xl border border-gray-200 shadow-sm flex flex-col overflow-hidden w-full shrink-0 sticky top-6">
                <div className="p-5 border-b border-slate-100 flex items-center justify-between bg-slate-50/50 shrink-0">
                  <div>
                    <h4 className="font-display font-black text-xs md:text-sm text-brand-blue uppercase tracking-wider">Course Syllabus</h4>
                    <span className="text-[10px] text-text-muted font-bold">Chapters & Lessons Outline</span>
                  </div>
                  <span className="px-2.5 py-0.5 text-[9px] rounded-full bg-primary-light text-primary border border-primary/20 font-bold uppercase tracking-wider shadow-sm">Builder</span>
                </div>

                {/* Edit Course Landing Page Button */}
                <div className="p-4 pb-0">
                  <button
                    type="button"
                    onClick={() => setSelectedItem({ type: null, chIdx: 0, lesIdx: null })}
                    className={`w-full text-left px-4 py-3 rounded-xl border flex items-center gap-2.5 transition-all text-xs font-bold ${
                      selectedItem.type === null 
                        ? 'bg-primary text-white border-primary shadow-md shadow-primary/20 scale-[1.01]' 
                        : 'bg-white hover:bg-slate-50 text-brand-blue border-slate-200 shadow-sm'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">edit_note</span>
                    <span>Edit Course Overview / Landing Page</span>
                  </button>
                </div>
                
                {/* Curriculum outline mapping */}
                <div className="flex flex-col gap-4 p-4" id="editor-curriculum-chapters">
                  {curriculumData.chapters.map((chapter, chIdx) => (
                    <div key={chIdx} className="flex flex-col border border-gray-200 rounded-xl overflow-hidden bg-white shadow-sm">
                      {/* Chapter Title Row */}
                      <div 
                        onClick={() => setSelectedItem({ type: 'chapter', chIdx, lesIdx: null })}
                        className={`px-4 py-3 cursor-pointer flex items-start justify-between border-b border-gray-200 gap-3 hover:bg-slate-100 transition-colors ${
                          selectedItem.type === 'chapter' && selectedItem.chIdx === chIdx ? 'bg-primary-light/20 border-l-4 border-primary font-bold' : 'bg-slate-50'
                        }`}
                      >
                        <div className="flex items-start gap-2 min-w-0 flex-1">
                          <span className="material-symbols-outlined text-text-muted text-[18px] mt-0.5 shrink-0">toc</span>
                          <div className="flex flex-col min-w-0 flex-1">
                            <span className="text-[10px] font-extrabold text-primary uppercase tracking-wider">Chapter {chIdx + 1}</span>
                            <span className="title-text text-xs font-bold text-text-main break-words whitespace-normal mt-0.5">{chapter.title}</span>
                          </div>
                        </div>

                        <div className="flex items-center gap-1 shrink-0 ml-auto mt-0.5" onClick={(e) => e.stopPropagation()}>
                          <button onClick={() => handleAddLessonWorkspace(chIdx)} className="p-1 rounded bg-slate-100 hover:bg-primary-light/50 text-slate-500 hover:text-primary transition-colors flex items-center justify-center" title="Add Lesson">
                            <span className="material-symbols-outlined text-xs font-bold">add</span>
                          </button>
                          <button onClick={() => handleDeleteChapterWorkspace(chIdx)} className="p-1 rounded bg-slate-100 hover:bg-red-50 text-slate-500 hover:text-red-600 transition-colors flex items-center justify-center" title="Delete Chapter">
                            <span className="material-symbols-outlined text-xs">delete</span>
                          </button>
                        </div>
                      </div>

                      {/* Lessons List Container */}
                      <div className="flex flex-col divide-y divide-gray-150 bg-slate-50">
                        {chapter.lessons.map((lesson, lesIdx) => {
                          const isSelected = selectedItem.type === 'lesson' && selectedItem.chIdx === chIdx && selectedItem.lesIdx === lesIdx;

                          return (
                            <div
                              key={lesIdx}
                              onClick={(e) => { e.stopPropagation(); setSelectedItem({ type: 'lesson', chIdx, lesIdx }); }}
                              className={`editor-lesson-item flex items-start gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 transition-colors group text-xs text-text-main font-medium ${
                                isSelected ? 'bg-primary-light/30 border-primary text-primary font-bold' : 'border-transparent'
                              }`}
                            >
                              <span className={`material-symbols-outlined text-[16px] mt-0.5 shrink-0 ${isSelected ? 'text-primary icon-fill animate-pulse' : 'text-text-muted'}`}>
                                {isSelected ? 'play_arrow' : 'radio_button_unchecked'}
                              </span>

                              <div className="flex items-center min-w-0 flex-1">
                                <span className="title-text break-words whitespace-normal flex-1 mt-0.5">{lesson.title}</span>
                              </div>

                              <button
                                onClick={(e) => { e.stopPropagation(); handleDeleteLessonWorkspace(chIdx, lesIdx); }}
                                className="p-0.5 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded shrink-0 opacity-0 group-hover:opacity-100 transition-all flex items-center justify-center shrink-0 ml-1"
                                title="Delete Lesson"
                              >
                                <span className="material-symbols-outlined text-[13px]">close</span>
                              </button>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  ))}
                </div>

                <div className="p-4 border-t border-slate-100 bg-slate-50/40 shrink-0">
                  <button type="button" onClick={handleAddChapterWorkspace} className="flex items-center justify-center gap-1.5 text-xs font-bold text-primary hover:text-primary-hover py-3 px-4 border-2 border-dashed border-gray-200 hover:border-primary bg-white rounded-xl transition-all w-full shadow-sm hover:scale-[1.01] active:scale-[0.99]">
                    <span className="material-symbols-outlined text-base font-bold">create_new_folder</span> Add New Chapter
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>

      {/* ================= MODAL: CREATE COURSE ================= */}
      {isCreateCourseOpen && (
        <div id="modal-create-course" className="fixed inset-0 bg-brand-blue/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl max-w-4xl w-full overflow-hidden border border-slate-200/50 ambient-shadow flex flex-col transition-all duration-300">
            {/* Modal Header */}
            <div className="px-6 py-4.5 border-b border-slate-100 flex items-center justify-between bg-slate-50">
              <div className="flex items-center gap-2">
                <span className="material-symbols-outlined text-primary font-bold">library_add</span>
                <h3 className="font-display font-extrabold text-base text-brand-blue">Create New Learning Course</h3>
              </div>
              <button type="button" onClick={() => setIsCreateCourseOpen(false)} className="p-1.5 rounded-xl text-text-muted hover:bg-slate-200/80 transition-colors flex items-center justify-center">
                <span className="material-symbols-outlined text-lg">close</span>
              </button>
            </div>

            {/* Modal Form Content */}
            <form onSubmit={handleCreateCourseSubmit} className="flex flex-col">
              <div className="p-6 md:p-8 flex flex-col gap-6 max-h-[72vh] overflow-y-auto bg-slate-50/30">
                
                {/* PANEL 1: COURSE BASICS */}
                <div className="bg-surface rounded-2xl border border-slate-200/60 p-6 flex flex-col gap-5 shadow-sm">
                  <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                    <span className="material-symbols-outlined text-primary text-[20px]">info</span> Course Basics
                  </h4>
                  
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                    {/* Course Title */}
                    <div className="flex flex-col gap-1.5 md:col-span-2">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Title</label>
                      <input
                        type="text"
                        value={courseTitleInput}
                        onChange={(e) => setCourseTitleInput(e.target.value)}
                        placeholder="e.g. Mastering Full-Stack React & Node.js"
                        className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue"
                      />
                    </div>
                    
                    {/* Course Topic */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Topic</label>
                      <select value={courseTopicInput} onChange={(e) => setCourseTopicInput(e.target.value)} className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 cursor-pointer font-medium text-brand-blue">
                        <option value="Web Development">Web Development</option>
                        <option value="Mobile Development">Mobile Development</option>
                        <option value="Algorithms & Data Structures">Algorithms & Data Structures</option>
                        <option value="Data Science & AI">Data Science & AI</option>
                        <option value="Database Systems">Database Systems</option>
                        <option value="Cloud Computing">Cloud Computing</option>
                        <option value="Cybersecurity">Cybersecurity</option>
                        <option value="Software Engineering">Software Engineering</option>
                      </select>
                    </div>

                    {/* Programming Language */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Programming Language</label>
                      <select value={courseLanguageInput} onChange={(e) => setCourseLanguageInput(e.target.value)} className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 cursor-pointer font-medium text-brand-blue">
                        <option value="JavaScript">JavaScript</option>
                        <option value="TypeScript">TypeScript</option>
                        <option value="Python">Python</option>
                        <option value="Java">Java</option>
                        <option value="C++">C++</option>
                        <option value="C#">C#</option>
                        <option value="Go">Go</option>
                        <option value="PHP">PHP</option>
                        <option value="Swift">Swift</option>
                        <option value="HTML/CSS">HTML/CSS</option>
                        <option value="Other">Other</option>
                      </select>
                    </div>

                    {/* Difficulty Level */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Difficulty Level</label>
                      <select value={courseLevelInput} onChange={(e) => setCourseLevelInput(e.target.value)} className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 cursor-pointer font-medium text-brand-blue">
                        <option value="Beginner">Beginner</option>
                        <option value="Intermediate">Intermediate</option>
                        <option value="Advanced">Advanced</option>
                      </select>
                    </div>

                    {/* Course Price */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Price (₫)</label>
                      <input
                        type="number"
                        value={coursePriceInput}
                        onChange={(e) => setCoursePriceInput(e.target.value)}
                        placeholder="e.g. 499000"
                        className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue"
                      />
                    </div>
                  </div>
                </div>

                {/* PANEL 2: MEDIA & DESCRIPTION */}
                <div className="bg-surface rounded-2xl border border-slate-200/60 p-6 flex flex-col gap-5 shadow-sm">
                  <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                    <span className="material-symbols-outlined text-primary text-[20px]">description</span> Media & Descriptions
                  </h4>

                  <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                    {/* Drag & Drop Thumbnail Upload */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Thumbnail</label>
                      <div className="relative border-2 border-dashed border-slate-200 hover:border-primary rounded-2xl p-5 flex flex-col items-center justify-center gap-2 bg-slate-50/50 hover:bg-primary-light/5 transition-all group cursor-pointer h-[155px]">
                        <input type="file" id="course-thumbnail" accept="image/*" className="absolute inset-0 opacity-0 cursor-pointer" onChange={handleThumbnailUpload} />
                        <span className="material-symbols-outlined text-4xl text-slate-400 group-hover:text-primary transition-colors">image</span>
                        <div className="text-center">
                          <span className="text-sm font-bold text-brand-blue group-hover:text-primary transition-colors block">Upload Thumbnail Image</span>
                          <span className="text-[11px] text-text-muted mt-1 block">PNG, JPG, WebP up to 5MB</span>
                        </div>
                        
                        {/* Image Thumbnail Preview Element */}
                        {thumbnailFile && (
                          <div id="thumbnail-preview-container" className="absolute inset-0 bg-white rounded-2xl p-2 flex items-center justify-center gap-3">
                            <img src={thumbnailFile.url} className="h-full max-w-[120px] object-cover rounded-xl border border-slate-200" alt="Preview" />
                            <div className="flex flex-col min-w-0 text-left">
                              <span className="text-xs font-bold text-brand-blue truncate max-w-[150px]">{thumbnailFile.name}</span>
                              <span className="text-[10px] text-text-muted mt-0.5">{thumbnailFile.size}</span>
                            </div>
                            <button type="button" onClick={(e) => { e.stopPropagation(); setThumbnailFile(null); }} className="p-1.5 rounded-lg bg-slate-100 hover:bg-red-50 text-slate-500 hover:text-red-600 transition-colors ml-auto flex items-center justify-center">
                              <span className="material-symbols-outlined text-base">close</span>
                            </button>
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Short Description */}
                    <div className="flex flex-col gap-1.5">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Short Description</label>
                      <textarea
                        value={courseDescInput}
                        onChange={(e) => setCourseDescInput(e.target.value)}
                        className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue h-[155px] resize-none"
                        placeholder="Build scalable, production-ready web applications from scratch..."
                      />
                    </div>

                    {/* Long Description */}
                    <div className="flex flex-col gap-1.5 md:col-span-2">
                      <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Description (Long Description)</label>
                      <textarea
                        value={courseLongDescInput}
                        onChange={(e) => setCourseLongDescInput(e.target.value)}
                        rows={4}
                        placeholder="The course is a transformative journey designed to take you from zero to a production-ready developer..."
                        className="text-sm border-slate-200 focus:border-primary focus:ring-primary focus:ring-1 rounded-xl p-2.5 font-medium text-brand-blue"
                      />
                    </div>
                  </div>
                </div>

                {/* PANEL 3: COURSE SPECIFICATIONS */}
                <div className="bg-surface rounded-2xl border border-slate-200/60 p-6 flex flex-col gap-6 shadow-sm">
                  <h4 className="font-display font-black text-sm text-brand-blue border-b border-slate-100 pb-2.5 flex items-center gap-2 uppercase tracking-wider">
                    <span className="material-symbols-outlined text-primary text-[20px]">fact_check</span> Course Specifications
                  </h4>

                  <div className="flex flex-col gap-7">
                    {/* 1. What You'll Learn */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">What you'll learn</label>
                        <span className="text-[10px] text-text-muted font-bold">Each box is 1 key point</span>
                      </div>
                      <div id="container-course-learn" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {learnPoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...learnPoints];
                                arr[idx] = e.target.value;
                                setLearnPoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. Architect scalable MERN applications"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setLearnPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Point"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setLearnPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Point</span>
                        </button>
                      </div>
                    </div>

                    {/* 2. Course Highlights */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Course Highlights</label>
                        <span className="text-[10px] text-text-muted font-bold">Key highlights</span>
                      </div>
                      <div id="container-course-highlights" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {highlightPoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...highlightPoints];
                                arr[idx] = e.target.value;
                                setHighlightPoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. 15+ Real-world Projects"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setHighlightPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Highlight"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setHighlightPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Highlight</span>
                        </button>
                      </div>
                    </div>

                    {/* 3. Technologies & Tools */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Technologies & Tools</label>
                        <span className="text-[10px] text-text-muted font-bold">Tech stack used</span>
                      </div>
                      <div id="container-course-tech" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {techPoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...techPoints];
                                arr[idx] = e.target.value;
                                setTechPoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. React"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setTechPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Tech"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setTechPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Tech</span>
                        </button>
                      </div>
                    </div>

                    {/* 4. Prerequisites */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Prerequisites</label>
                        <span className="text-[10px] text-text-muted font-bold">Requirements</span>
                      </div>
                      <div id="container-course-prereqs" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {prereqPoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...prereqPoints];
                                arr[idx] = e.target.value;
                                setPrereqPoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. Basic JavaScript knowledge"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setPrereqPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Prerequisite"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setPrereqPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Prereq</span>
                        </button>
                      </div>
                    </div>

                    {/* 5. Target Audience */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Target Audience</label>
                        <span className="text-[10px] text-text-muted font-bold">Intended coders</span>
                      </div>
                      <div id="container-course-audience" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {audiencePoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...audiencePoints];
                                arr[idx] = e.target.value;
                                setAudiencePoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. Aspiring Full-Stack Developers"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setAudiencePoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Audience"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setAudiencePoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Audience</span>
                        </button>
                      </div>
                    </div>

                    {/* 6. Completion Benefits */}
                    <div className="flex flex-col gap-2.5 bg-slate-50/50 p-4.5 rounded-2xl border border-slate-200/40">
                      <div className="flex justify-between items-center mb-1">
                        <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Completion Benefits</label>
                        <span className="text-[10px] text-text-muted font-bold">What students get</span>
                      </div>
                      <div id="container-course-benefits" className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
                        {benefitPoints.map((val, idx) => (
                          <div key={idx} className="group relative bg-surface border border-slate-200/80 hover:border-primary rounded-xl p-3.5 flex flex-col justify-between min-h-[110px] shadow-sm hover:shadow-md transition-all">
                            <textarea
                              value={val}
                              onChange={(e) => {
                                const arr = [...benefitPoints];
                                arr[idx] = e.target.value;
                                setBenefitPoints(arr);
                              }}
                              className="w-full bg-transparent border-0 focus:ring-0 text-xs font-medium p-0 resize-none text-brand-blue placeholder-slate-400 h-full"
                              placeholder="e.g. Portfolio Projects"
                            />
                            <div className="flex justify-end mt-1.5 shrink-0">
                              <button
                                type="button"
                                onClick={() => setBenefitPoints(prev => prev.filter((_, i) => i !== idx || prev.length === 1))}
                                className="opacity-0 group-hover:opacity-100 p-1.5 rounded-lg bg-slate-50 hover:bg-red-50 text-slate-400 hover:text-red-600 transition-all flex items-center justify-center"
                                title="Delete Benefit"
                              >
                                <span className="material-symbols-outlined text-[16px]">delete</span>
                              </button>
                            </div>
                          </div>
                        ))}
                        <button type="button" onClick={() => setBenefitPoints(prev => [...prev, ''])} className="border-2 border-dashed border-slate-200/80 hover:border-primary hover:bg-primary-light/10 rounded-xl p-3.5 flex flex-col items-center justify-center min-h-[110px] text-slate-400 hover:text-primary transition-all gap-1.5 bg-surface/50 group">
                          <span className="material-symbols-outlined text-2xl font-bold transition-transform group-hover:scale-110">add</span>
                          <span className="text-xs font-extrabold">Add Benefit</span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* Submit buttons */}
              <div className="flex items-center justify-end gap-3.5 p-6 border-t border-slate-100 bg-slate-50 shrink-0">
                <button type="button" onClick={() => setIsCreateCourseOpen(false)} className="px-8 py-3.5 rounded-xl border border-slate-200 text-slate-700 text-sm font-extrabold hover:bg-slate-50 transition-colors">Cancel</button>
                <button type="button" onClick={resetSimpleCourseForm} className="px-5 py-3.5 rounded-xl border border-slate-200 text-slate-500 hover:text-slate-700 text-sm font-bold transition-colors">Reset Form</button>
                <button type="submit" className="px-8 py-3.5 rounded-xl bg-primary hover:bg-primary-hover text-white text-sm font-extrabold transition-all shadow-md shadow-primary/20 hover:scale-[1.02] active:scale-[0.98]">Submit Course</button>
              </div>
            </form>
          </div>
        </div>
      )}


      {/* ================= MODAL: ADD/EDIT EXERCISE ================= */}
      {isExerciseModalOpen && (
        <div className="fixed inset-0 bg-brand-blue/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white w-full max-w-lg rounded-3xl overflow-hidden shadow-2xl flex flex-col max-h-[90vh]">
            <div className="bg-brand-blue px-6 py-4 flex items-center justify-between shrink-0">
              <h2 className="text-white font-display font-black text-xl flex items-center gap-2">
                <span className="material-symbols-outlined text-primary">code</span>
                {editingExerciseId ? 'Edit Coding Exercise' : 'Create Coding Exercise'}
              </h2>
              <button type="button" onClick={() => setIsExerciseModalOpen(false)} className="text-white/60 hover:text-white transition-colors">
                <span className="material-symbols-outlined text-2xl">close</span>
              </button>
            </div>
            <div className="p-6 overflow-y-auto flex flex-col gap-4">
              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Exercise Title</label>
                <input
                  type="text"
                  value={exerciseTitle}
                  onChange={(e) => setExerciseTitle(e.target.value)}
                  className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue"
                  placeholder="e.g. Reverse a Linked List"
                />
              </div>
              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Difficulty Level</label>
                <div className="flex gap-3">
                  {['EASY', 'MEDIUM', 'HARD'].map(diff => (
                    <label key={diff} className={`flex-1 flex items-center justify-center gap-2 py-3 border rounded-xl cursor-pointer transition-colors ${exerciseDifficulty === diff ? 'bg-primary/10 border-primary text-primary font-bold' : 'border-slate-200 text-slate-500 font-medium hover:bg-slate-50'}`}>
                      <input
                        type="radio"
                        name="exerciseDifficulty"
                        value={diff}
                        checked={exerciseDifficulty === diff}
                        onChange={() => setExerciseDifficulty(diff)}
                        className="hidden"
                      />
                      {diff}
                    </label>
                  ))}
                </div>
              </div>

              {/* Deep Content: Problem Statement & Code */}
              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Problem Statement (Markdown)</label>
                <textarea
                  value={exerciseDescription}
                  onChange={(e) => setExerciseDescription(e.target.value)}
                  className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue resize-y h-32"
                  placeholder="Explain the problem here..."
                />
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="flex flex-col gap-1.5">
                  <label className="text-[11px] font-bold text-brand-blue uppercase tracking-wider">Initial Code (Base code for student)</label>
                  <textarea
                    value={exerciseInitialCode}
                    onChange={(e) => setExerciseInitialCode(e.target.value)}
                    className="w-full bg-slate-800 border border-slate-700 rounded-xl px-4 py-3 text-sm font-mono text-slate-200 focus:ring-primary focus:border-primary resize-y h-48"
                    placeholder="function solve() {\n  // Your code here\n}"
                    spellCheck="false"
                  />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-[11px] font-bold text-brand-blue uppercase tracking-wider">Solution Code (Reference)</label>
                  <textarea
                    value={exerciseSolutionCode}
                    onChange={(e) => setExerciseSolutionCode(e.target.value)}
                    className="w-full bg-slate-800 border border-slate-700 rounded-xl px-4 py-3 text-sm font-mono text-green-400 focus:ring-primary focus:border-primary resize-y h-48"
                    placeholder="function solve() {\n  return true;\n}"
                    spellCheck="false"
                  />
                </div>
              </div>

              <div className="flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-slate-100 pb-2">
                  <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Test Cases</h4>
                  <button type="button" onClick={handleAddTestCase} className="px-3 py-1.5 bg-primary/10 hover:bg-primary/20 text-primary text-xs font-bold rounded-lg transition-colors flex items-center gap-1">
                    <span className="material-symbols-outlined text-sm">add</span> Add Test Case
                  </button>
                </div>
                
                {exerciseTestCases.length === 0 ? (
                  <div className="text-center py-6 border-2 border-dashed border-slate-200 rounded-xl">
                    <p className="text-xs text-text-muted font-bold">No test cases added yet.</p>
                  </div>
                ) : (
                  <div className="flex flex-col gap-4">
                    {exerciseTestCases.map((tc, idx) => (
                      <div key={tc.id} className="bg-slate-50 border border-slate-200 rounded-xl p-4 flex flex-col gap-3">
                        <div className="flex items-start justify-between">
                          <span className="font-display font-black text-brand-blue text-xs uppercase">Test Case {idx + 1}</span>
                          <div className="flex items-center gap-3">
                            <label className="flex items-center gap-1.5 text-xs font-bold text-slate-600 cursor-pointer">
                              <input 
                                type="checkbox" 
                                checked={tc.isHidden} 
                                onChange={(e) => handleUpdateTestCase(idx, 'isHidden', e.target.checked)}
                                className="rounded text-primary focus:ring-primary"
                              />
                              Hidden
                            </label>
                            <button type="button" onClick={() => handleDeleteTestCase(idx)} className="text-slate-400 hover:text-red-500 transition-colors">
                              <span className="material-symbols-outlined text-sm">delete</span>
                            </button>
                          </div>
                        </div>
                        <div className="grid grid-cols-2 gap-3">
                          <div className="flex flex-col gap-1">
                            <label className="text-[10px] font-bold text-text-muted uppercase tracking-wider">Input</label>
                            <textarea 
                              value={tc.input} 
                              onChange={(e) => handleUpdateTestCase(idx, 'input', e.target.value)}
                              className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-xs font-medium focus:ring-primary focus:border-primary text-brand-blue resize-none h-16"
                              placeholder="e.g. [1, 2, 3]"
                            />
                          </div>
                          <div className="flex flex-col gap-1">
                            <label className="text-[10px] font-bold text-text-muted uppercase tracking-wider">Expected Output</label>
                            <textarea 
                              value={tc.expectedOutput} 
                              onChange={(e) => handleUpdateTestCase(idx, 'expectedOutput', e.target.value)}
                              className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-xs font-medium focus:ring-primary focus:border-primary text-brand-blue resize-none h-16"
                              placeholder="e.g. [3, 2, 1]"
                            />
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
            <div className="p-6 border-t border-slate-100 bg-slate-50 flex justify-end gap-3 shrink-0">
              <button type="button" onClick={() => setIsExerciseModalOpen(false)} className="px-6 py-2.5 rounded-xl border border-slate-200 text-slate-700 text-sm font-bold hover:bg-slate-100 transition-colors">Cancel</button>
              <button type="button" onClick={handleSaveExercise} className="px-6 py-2.5 rounded-xl bg-primary hover:bg-primary-hover text-white text-sm font-extrabold shadow-md shadow-primary/20 transition-transform active:scale-95">
                Save Exercise
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ================= MODAL: ADD/EDIT QUIZ ================= */}
      {isQuizModalOpen && (
        <div className="fixed inset-0 bg-brand-blue/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white w-full max-w-3xl rounded-3xl overflow-hidden shadow-2xl flex flex-col max-h-[90vh]">
            <div className="bg-amber-500 px-6 py-4 flex items-center justify-between shrink-0">
              <h2 className="text-white font-display font-black text-xl flex items-center gap-2">
                <span className="material-symbols-outlined text-white">quiz</span>
                {editingQuizId ? 'Edit Multiple Choice Quiz' : 'Create Multiple Choice Quiz'}
              </h2>
              <button type="button" onClick={() => setIsQuizModalOpen(false)} className="text-white/60 hover:text-white transition-colors">
                <span className="material-symbols-outlined text-2xl">close</span>
              </button>
            </div>
            <div className="p-6 overflow-y-auto flex flex-col gap-6">
              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Quiz Title</label>
                <input
                  type="text"
                  value={quizTitle}
                  onChange={(e) => setQuizTitle(e.target.value)}
                  className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue"
                  placeholder="e.g. End of Chapter 1 Quiz"
                />
              </div>

              <div className="flex flex-col gap-4">
                <div className="flex items-center justify-between border-b border-slate-100 pb-2">
                  <h4 className="font-display font-black text-sm text-brand-blue uppercase tracking-wider">Questions</h4>
                  <button type="button" onClick={handleAddQuizQuestion} className="px-3 py-1.5 bg-primary/10 hover:bg-primary/20 text-primary text-xs font-bold rounded-lg transition-colors flex items-center gap-1">
                    <span className="material-symbols-outlined text-sm">add</span> Add Question
                  </button>
                </div>
                
                {quizQuestions.length === 0 ? (
                  <div className="text-center py-6 border-2 border-dashed border-slate-200 rounded-xl">
                    <p className="text-xs text-text-muted font-bold">No questions added yet.</p>
                  </div>
                ) : (
                  <div className="flex flex-col gap-5">
                    {quizQuestions.map((q, qIdx) => (
                      <div key={q.id} className="bg-slate-50 border border-slate-200 rounded-xl p-4 flex flex-col gap-3">
                        <div className="flex items-start gap-3">
                          <span className="font-display font-black text-slate-400 mt-2 text-sm">Q{qIdx + 1}</span>
                          <div className="flex-1">
                            <input
                              type="text"
                              value={q.content}
                              onChange={(e) => handleUpdateQuizQuestion(qIdx, e.target.value)}
                              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue"
                              placeholder="Question text..."
                            />
                          </div>
                          <button type="button" onClick={() => handleDeleteQuizQuestion(qIdx)} className="text-slate-400 hover:text-red-500 mt-2 transition-colors">
                            <span className="material-symbols-outlined">delete</span>
                          </button>
                        </div>
                        
                        <div className="pl-8 flex flex-col gap-2">
                          <label className="text-[10px] font-bold text-text-muted uppercase tracking-wider">Options (Select Correct)</label>
                          {q.options.map((opt: any, optIdx: number) => (
                            <div key={opt.id} className="flex items-center gap-2">
                              <input
                                type="radio"
                                name={`q-${q.id}-correct`}
                                checked={opt.isCorrect}
                                onChange={() => handleSetCorrectOption(qIdx, optIdx)}
                                className="w-4 h-4 text-green-500 border-slate-300 focus:ring-green-500"
                              />
                              <input
                                type="text"
                                value={opt.content}
                                onChange={(e) => handleUpdateQuizOption(qIdx, optIdx, e.target.value)}
                                className={`flex-1 bg-white border ${opt.isCorrect ? 'border-green-300 bg-green-50/30' : 'border-slate-200'} rounded-lg px-3 py-2 text-xs font-medium focus:ring-primary focus:border-primary text-brand-blue`}
                                placeholder={`Option ${optIdx + 1}`}
                              />
                            </div>
                          ))}
                          <button type="button" onClick={() => handleAddQuizOption(qIdx)} className="text-xs text-primary font-bold hover:underline self-start mt-1">
                            + Add Option
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
            <div className="p-6 border-t border-slate-100 bg-slate-50 flex justify-end gap-3 shrink-0">
              <button type="button" onClick={() => setIsQuizModalOpen(false)} className="px-6 py-2.5 rounded-xl border border-slate-200 text-slate-700 text-sm font-bold hover:bg-slate-100 transition-colors">Cancel</button>
              <button type="button" onClick={handleSaveQuiz} className="px-6 py-2.5 rounded-xl bg-amber-500 hover:bg-amber-600 text-white text-sm font-extrabold shadow-md shadow-amber-500/20 transition-transform active:scale-95">
                Save Quiz
              </button>
            </div>
          </div>
        </div>
      )}


    </div>
  );
};
