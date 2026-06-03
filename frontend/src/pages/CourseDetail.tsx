import React, { useState, useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { fetchCourseDetail, type CourseDetailResponse } from '../services/courseService';

export const CourseDetail: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const [course, setCourse] = useState<CourseDetailResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Tab Switching State
  const [activeTab, setActiveTab] = useState<'about' | 'curriculum' | 'reviews'>('about');

  // Curriculum Accordion State
  const [section1Open, setSection1Open] = useState(true);

  // Cart & Video Modal Interactive States
  const [addedToCart, setAddedToCart] = useState(false);
  const [successMessage, setSuccessMessage] = useState('');
  const [isVideoModalOpen, setIsVideoModalOpen] = useState(false);

  const { addToCart } = useApp();

  useEffect(() => {
    const loadDetail = async () => {
      if (!id) return;
      setLoading(true);
      setError(null);
      try {
        const data = await fetchCourseDetail(id);
        setCourse(data);
      } catch (err: any) {
        setError(err.message || 'Không thể tải thông tin chi tiết khóa học');
      } finally {
        setLoading(false);
      }
    };
    loadDetail();
  }, [id]);

  const handleAddToCart = () => {
    if (course) {
      addToCart(course.id.toString());
      setSuccessMessage('Đã thêm khóa học vào giỏ hàng thành công!');
      setAddedToCart(true);
      setTimeout(() => {
        setSuccessMessage('');
      }, 2500);
    }
  };

  const parseList = (text?: string): string[] => {
    if (!text) return [];
    return text.split('\n').map(line => line.replace(/^[-*•\d.]+\s*/, '').trim()).filter(Boolean);
  };

  const getInstructorAvatar = (url?: string) => {
    if (url && url.trim() !== '') return url;
    return 'https://ui-avatars.com/api/?name=' + encodeURIComponent(course?.instructorName || 'Instructor') + '&background=12284C&color=fff';
  };

  if (loading) {
    return (
      <div className="w-full min-h-[500px] flex flex-col items-center justify-center text-center p-12">
        <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-primary mb-4"></div>
        <h3 className="text-base font-bold text-brand-blue">Loading Course Details...</h3>
        <p className="text-xs text-text-muted mt-1">Retrieving dynamic parameters from the server.</p>
      </div>
    );
  }

  if (error || !course) {
    return (
      <div className="w-full min-h-[500px] flex flex-col items-center justify-center text-center p-12 max-w-md mx-auto">
        <span className="material-symbols-outlined text-red-500 text-6xl mb-4">error</span>
        <h3 className="text-lg font-bold text-red-700">Error Loading Course</h3>
        <p className="text-sm text-red-600 mt-2">{error || 'Không tìm thấy khóa học'}</p>
        <Link 
          to="/courses"
          className="mt-6 px-6 py-2.5 bg-primary hover:bg-primary-hover text-white rounded-xl text-sm font-bold transition-all shadow-md"
        >
          Trở lại danh sách khóa học
        </Link>
      </div>
    );
  }

  const whatYouLearnList = parseList(course.whatYouLearn);
  const highlightsList = parseList(course.courseHighlight);
  const prerequisitesList = parseList(course.prerequisites);
  const audienceList = parseList(course.targetAudience);
  const benefitsList = parseList(course.completionBenefits);
  const techToolsList = course.technologyTool ? course.technologyTool.split(',').map(s => s.trim()).filter(Boolean) : [];

  return (
    <div className="w-full text-left">
      {/* Styles defined in HTML */}
      <style>{`
        .active-tab {
          border-bottom: 2px solid #F36F21;
          color: #F36F21;
          font-weight: 700;
        }

        .bento-shadow {
          box-shadow: 0 4px 20px rgba(26, 54, 93, 0.08);
        }
      `}</style>

      {/* Dynamic Alerts */}
      {successMessage && (
        <div className="fixed top-20 right-8 bg-brand-green border border-brand-green/30 text-white p-4 rounded-xl z-50 font-bold flex items-center gap-2 animate-fade-in shadow-xl">
          <span className="material-symbols-outlined text-[20px] icon-fill">check_circle</span>
          {successMessage}
        </div>
      )}

      {/* Video Modal Popup */}
      {isVideoModalOpen && (
        <div 
          onClick={() => setIsVideoModalOpen(false)}
          className="fixed inset-0 z-[100] flex items-center justify-center bg-black/80 backdrop-blur-sm animate-fade-in"
        >
          <div 
            onClick={(e) => e.stopPropagation()}
            className="relative w-full max-w-3xl aspect-video bg-black rounded-2xl overflow-hidden shadow-2xl mx-4"
          >
            <button 
              onClick={() => setIsVideoModalOpen(false)}
              className="absolute top-4 right-4 bg-white/20 hover:bg-white/40 text-white rounded-full p-2 transition-all z-10 flex items-center justify-center"
            >
              <span className="material-symbols-outlined">close</span>
            </button>
            <iframe 
              className="w-full h-full"
              src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1"
              title="Course Preview Video"
              frameBorder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
            ></iframe>
          </div>
        </div>
      )}

      {/* Updated Hero Banner Section */}
      <div className="bg-brand-blue text-white pt-24 pb-32">
        <div className="max-w-[1440px] mx-auto px-4 md:px-16 flex flex-col lg:flex-row gap-12 text-left">
          <div className="w-full lg:w-[72%] space-y-6">
            <div className="flex gap-3">
              <span className="bg-primary-light text-primary border border-primary/30 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider">
                {course.categoryName || 'GENERAL'}
              </span>
              <span className="bg-brand-blue-light text-white border border-white/50 px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider">
                {course.type || 'ONLINE'}
              </span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold leading-tight">{course.title}</h1>
            <p className="text-lg md:text-xl font-medium max-w-3xl text-gray-300 font-body leading-relaxed">
              {course.shortDescription}
            </p>
            <div className="flex flex-wrap gap-6 items-center pt-2">
              <div className="flex items-center gap-1">
                <span className="material-symbols-outlined text-yellow-400" style={{ fontVariationSettings: '"FILL" 1' }}>
                  star
                </span>
                <span className="font-bold text-white">{course.averageRating}</span>
                <span className="text-sm text-gray-300 ml-1">({course.totalReviews} ratings)</span>
              </div>
              <div className="flex items-center gap-1.5 text-gray-300">
                <span className="material-symbols-outlined text-sm">group</span>
                <span className="text-sm">{course.totalEnrolled.toLocaleString('en-US')} students</span>
              </div>
            </div>
            <div className="pt-4 flex items-center gap-4">
              <img
                alt="Instructor"
                className="w-12 h-12 rounded-full object-cover border-2 border-white/20"
                src={getInstructorAvatar(course.instructorAvatarUrl)}
              />
              <div>
                <p className="text-sm font-medium text-gray-300">
                  Created by <span className="text-white font-bold">{course.instructorName}</span>
                </p>
                <p className="text-sm text-gray-400">{course.instructorTitle || 'Instructor'}</p>
              </div>
            </div>
          </div>
          <div className="hidden lg:block w-[28%] relative">
            {/* Spacer to allow absolute positioning of sidebar */}
          </div>
        </div>
      </div>

      <main className="max-w-[1440px] mx-auto px-4 md:px-16 pb-20 -mt-20 relative z-10">
        {/* Two Column Layout */}
        <div className="flex flex-col lg:flex-row gap-12 text-left">
          {/* Main Content (72%) */}
          <div className="w-full lg:w-[72%] bg-surface rounded-2xl p-8 shadow-sm border border-gray-200">
            {/* Tab Navigation */}
            <div className="flex gap-8 border-b border-gray-200 mb-10 overflow-x-auto whitespace-nowrap" id="course-tabs">
              <button
                onClick={() => setActiveTab('about')}
                className={`pb-4 text-body-md transition-all ${activeTab === 'about' ? 'active-tab text-primary' : 'text-text-muted hover:text-primary'}`}
              >
                About
              </button>
              <button
                onClick={() => setActiveTab('curriculum')}
                className={`pb-4 text-body-md transition-all ${activeTab === 'curriculum' ? 'active-tab text-primary' : 'text-text-muted hover:text-primary'}`}
              >
                Curriculum
              </button>
              <button
                onClick={() => setActiveTab('reviews')}
                className={`pb-4 text-body-md transition-all ${activeTab === 'reviews' ? 'active-tab text-primary' : 'text-text-muted hover:text-primary'}`}
              >
                Reviews
              </button>
            </div>

            {/* Dynamic Content Wrapper */}
            <div className="space-y-12">
              {/* 1. ABOUT SECTION */}
              <div id="content-about" className={`space-y-12 transition-all duration-300 ${activeTab === 'about' ? '' : 'hidden'}`}>
                {/* Course Description */}
                <section>
                  <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                    <span className="w-1.5 h-8 bg-primary rounded-full"></span>Course Description
                  </h2>
                  <div className="text-body-lg text-text-muted leading-relaxed max-w-4xl whitespace-pre-line font-body">
                    {course.longDescription}
                  </div>
                </section>

                {/* What you'll learn */}
                {whatYouLearnList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>What you'll learn
                    </h2>
                    <div className="grid md:grid-cols-2 gap-4">
                      {whatYouLearnList.map((item, idx) => (
                        <div key={idx} className="p-6 bg-surface-gray rounded-xl border border-gray-200 flex items-start gap-4 hover:border-brand-green transition-all">
                          <span className="material-symbols-outlined text-brand-green" style={{ fontVariationSettings: '"FILL" 1' }}>
                            check_circle
                          </span>
                          <p className="text-body-md font-semibold text-text-main font-body leading-relaxed">{item}</p>
                        </div>
                      ))}
                    </div>
                  </section>
                )}

                {/* Course Highlights */}
                {highlightsList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>Course Highlights
                    </h2>
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                      {highlightsList.map((item, idx) => (
                        <div key={idx} className="p-6 bg-surface-gray rounded-xl text-center space-y-3">
                          <span className="material-symbols-outlined text-primary text-4xl">
                            {idx % 3 === 0 ? 'developer_mode' : idx % 3 === 1 ? 'all_inclusive' : 'person_celebrate'}
                          </span>
                          <p className="font-bold text-text-main font-body">{item}</p>
                        </div>
                      ))}
                    </div>
                  </section>
                )}

                {/* Technologies & Tools */}
                {techToolsList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>Technologies {"&"} Tools
                    </h2>
                    <div className="flex flex-wrap gap-3">
                      {techToolsList.map((tool, idx) => (
                        <span key={idx} className="px-6 py-2 border border-gray-200 rounded-full text-text-muted font-medium hover:bg-gray-50 transition-colors cursor-default font-body">
                          {tool}
                        </span>
                      ))}
                    </div>
                  </section>
                )}

                {/* Prerequisites */}
                {prerequisitesList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>Prerequisites
                    </h2>
                    <div className="border-l-4 border-primary bg-surface-gray p-6 rounded-r-xl">
                      <ul className="list-disc list-inside space-y-2 text-text-muted font-body">
                        {prerequisitesList.map((item, idx) => (
                          <li key={idx} className="leading-relaxed">{item}</li>
                        ))}
                      </ul>
                    </div>
                  </section>
                )}

                {/* Target Audience */}
                {audienceList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>Target Audience
                    </h2>
                    <div className="space-y-4">
                      {audienceList.map((item, idx) => (
                        <div key={idx} className="flex items-center gap-3">
                          <span className="material-symbols-outlined text-text-muted">
                            {idx % 3 === 0 ? 'school' : idx % 3 === 1 ? 'code_blocks' : 'terminal'}
                          </span>
                          <span className="text-text-muted font-semibold font-body">{item}</span>
                        </div>
                      ))}
                    </div>
                  </section>
                )}

                {/* Completion Benefits */}
                {benefitsList.length > 0 && (
                  <section>
                    <h2 className="text-headline-md font-bold text-text-main mb-6 flex items-center gap-3">
                      <span className="w-1.5 h-8 bg-primary rounded-full"></span>Completion Benefits
                    </h2>
                    <div className="p-8 bg-surface-gray rounded-2xl border border-primary/20 flex flex-col md:flex-row items-center gap-8">
                      <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center shrink-0">
                        <span className="material-symbols-outlined text-primary text-5xl">emoji_events</span>
                      </div>
                      <div className="grid md:grid-cols-3 gap-6 w-full">
                        {benefitsList.slice(0, 3).map((item, idx) => (
                          <div key={idx} className="text-center md:text-left">
                            <p className="font-bold text-text-main font-body">{item}</p>
                            <p className="text-sm text-text-muted font-body mt-1">
                              {idx === 0 ? 'Industry recognized' : idx === 1 ? 'Ready for employers' : 'Placement assistance'}
                            </p>
                          </div>
                        ))}
                      </div>
                    </div>
                  </section>
                )}
              </div>

              {/* 2. CURRICULUM SECTION */}
              <div id="content-curriculum" className={`space-y-12 transition-all duration-300 ${activeTab === 'curriculum' ? '' : 'hidden'}`}>
                <section className="space-y-6">
                  <div className="flex justify-between items-end mb-4">
                    <h2 className="text-headline-md font-bold text-text-main">Course Content</h2>
                    <p className="text-body-md text-text-muted font-medium font-body">
                      {course.totalLessons} lessons • {course.totalQuizzes} quizzes
                    </p>
                  </div>
                  <div className="border border-gray-200 rounded-xl overflow-hidden">
                    <div className="bg-surface-gray border-b border-gray-200">
                      <div 
                        onClick={() => setSection1Open(!section1Open)}
                        className="p-4 flex justify-between items-center cursor-pointer select-none"
                      >
                        <div className="flex items-center gap-3">
                          <span 
                            className="material-symbols-outlined text-text-main transition-transform duration-200"
                            style={{ transform: section1Open ? 'rotate(0deg)' : 'rotate(-90deg)' }}
                          >
                            expand_more
                          </span>
                          <h3 className="font-bold text-text-main">Chương trình học</h3>
                        </div>
                        <span className="text-body-sm text-text-muted font-medium font-body">
                          {course.totalLessons} bài học
                        </span>
                      </div>
                      <div className={`bg-surface divide-y divide-gray-200 transition-all duration-200 ${section1Open ? '' : 'hidden'}`}>
                        <div className="p-8 text-center text-text-muted font-body">
                          <span className="material-symbols-outlined text-5xl mb-2 text-gray-300">menu_book</span>
                          <p className="font-semibold">Nội dung chương trình học chi tiết đang được cập nhật.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
              </div>

              {/* 3. REVIEWS SECTION */}
              <div id="content-reviews" className={`space-y-12 transition-all duration-300 ${activeTab === 'reviews' ? '' : 'hidden'}`}>
                <section className="space-y-8 animate-in fade-in duration-500">
                  <h2 className="text-headline-md font-bold text-text-main mb-6">Student Feedback</h2>
                  <div className="flex flex-col md:flex-row gap-10 items-start md:items-center p-8 bg-surface-gray border border-gray-200 rounded-2xl">
                    <div className="flex flex-col items-center gap-2 shrink-0">
                      <span className="text-6xl font-extrabold text-primary">{course.averageRating}</span>
                      <div className="flex text-yellow-400">
                        {Array.from({ length: 5 }).map((_, i) => (
                          <span key={i} className="material-symbols-outlined" style={{ fontVariationSettings: i < Math.round(course.averageRating) ? '"FILL" 1' : '' }}>star</span>
                        ))}
                      </div>
                      <span className="text-body-md font-bold text-text-main">Course Rating</span>
                    </div>
                    <div className="flex-1 w-full space-y-3">
                      <div className="flex items-center gap-4">
                        <div className="w-full bg-gray-200 rounded-full h-2.5 overflow-hidden">
                          <div className="bg-primary h-full" style={{ width: '85%' }}></div>
                        </div>
                        <div className="flex items-center gap-4 min-w-[160px] font-body">
                          <div className="flex text-yellow-400">
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                          </div>
                          <span className="text-body-sm font-semibold text-text-muted">{Math.round(course.totalReviews * 0.85)}</span>
                        </div>
                      </div>
                      <div className="flex items-center gap-4">
                        <div className="w-full bg-gray-200 rounded-full h-2.5 overflow-hidden">
                          <div className="bg-primary h-full" style={{ width: '10%' }}></div>
                        </div>
                        <div className="flex items-center gap-4 min-w-[160px] font-body">
                          <div className="flex text-yellow-400">
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                            <span className="material-symbols-outlined text-[18px]">star</span>
                          </div>
                          <span className="text-body-sm font-semibold text-text-muted">{Math.round(course.totalReviews * 0.10)}</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="space-y-6 pt-6">
                    <h3 className="text-headline-sm font-bold text-text-main">Reviews</h3>
                    <div className="divide-y divide-gray-200">
                      <div className="py-8 flex flex-col sm:flex-row gap-6">
                        <div className="w-12 h-12 rounded-full bg-brand-blue flex items-center justify-center text-white font-bold shrink-0">
                          DT
                        </div>
                        <div className="flex-1 space-y-3">
                          <div className="flex justify-between items-start">
                            <div>
                              <p className="font-bold text-text-main">David Thompson</p>
                              <div className="flex text-yellow-400 scale-75 origin-left -ml-1">
                                <span className="material-symbols-outlined" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                                <span className="material-symbols-outlined" style={{ fontVariationSettings: '"FILL" 1' }}>star</span>
                              </div>
                            </div>
                            <span className="text-body-sm text-text-muted font-body">2 days ago</span>
                          </div>
                          <p className="text-body-md text-text-main leading-relaxed font-body">
                            Khóa học rất hay và thực tế! Nội dung trình bày mạch lạc, dễ hiểu, các bài tập thực hành giúp tôi nắm vững kiến thức nhanh chóng.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
              </div>
            </div>
          </div>

          {/* Sidebar (28%) */}
          <div className="w-full lg:w-[28%] -mt-[320px]">
            <div className="sticky top-24 bg-surface rounded-2xl shadow-xl border border-gray-200 overflow-hidden">
              {/* Video Preview */}
              <div 
                onClick={() => setIsVideoModalOpen(true)}
                className="relative w-full aspect-video group cursor-pointer"
              >
                <img
                  alt="Course Preview"
                  className="w-full h-full object-cover"
                  src={course.thumbnailUrl || "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800"}
                />
                <div className="absolute inset-0 bg-black/40 flex items-center justify-center group-hover:bg-black/50 transition-colors">
                  <div className="w-16 h-16 bg-white/90 rounded-full flex items-center justify-center shadow-lg group-hover:scale-110 transition-transform">
                    <span className="material-symbols-outlined text-primary text-4xl ml-1">play_arrow</span>
                  </div>
                </div>
                <div className="absolute bottom-4 left-0 w-full text-center">
                  <span className="text-white font-bold text-lg drop-shadow-md">Preview this course</span>
                </div>
              </div>
              <div className="p-6">
                {/* Pricing Section */}
                <div className="flex items-end gap-3 mb-6">
                  {course.price === 0 ? (
                    <span className="text-3xl font-extrabold text-brand-green">Free</span>
                  ) : (
                    <span className="text-3xl font-extrabold text-text-main">
                      {course.price.toLocaleString('vi-VN')}đ
                    </span>
                  )}
                </div>
                {/* Action Buttons */}
                <div className="space-y-3 mb-6">
                  {course.enrolled ? (
                    <span className="w-full block py-4 bg-brand-green text-white text-center font-bold rounded-xl shadow-md cursor-default">
                      Bạn đã tham gia
                    </span>
                  ) : addedToCart ? (
                    <Link
                      to="/shopping-cart"
                      className="w-full block py-4 bg-brand-blue hover:bg-brand-blue-light text-white text-center font-bold rounded-xl transition-all shadow-md font-body"
                    >
                      Go to Cart
                    </Link>
                  ) : (
                    <button
                      onClick={handleAddToCart}
                      className="w-full py-4 bg-primary text-white font-bold rounded-xl hover:bg-primary-hover active:scale-[0.98] transition-all shadow-md font-body"
                    >
                      Add to Cart
                    </button>
                  )}
                </div>
                {/* Course Info List */}
                <div className="space-y-4">
                  <h3 className="font-bold text-text-main mb-4 font-body">This course includes:</h3>
                  <div className="flex items-center gap-3 text-text-muted font-body">
                    <span className="material-symbols-outlined text-[20px]">description</span>
                    <span className="text-sm">{course.totalLessons} lessons</span>
                  </div>
                  <div className="flex items-center gap-3 text-text-muted font-body">
                    <span className="material-symbols-outlined text-[20px]">quiz</span>
                    <span className="text-sm">{course.totalQuizzes} quizzes</span>
                  </div>
                  <div className="flex items-center gap-3 text-text-muted font-body">
                    <span className="material-symbols-outlined text-[20px]">play_circle</span>
                    <span className="text-sm">{course.totalVideos} videos</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
};
