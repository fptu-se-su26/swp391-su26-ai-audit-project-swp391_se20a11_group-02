import React, { useState, useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { problemService } from '../services/problemService';
import type { ProblemDetail, SubmitResponse, ProblemComment } from '../services/problemService';
import { useApp } from '../context/AppContext';

export const SolveProblem: React.FC = () => {
  const { user } = useApp();
  const { id } = useParams<{ id: string }>();

  const [activeTab, setActiveTab] = useState<'description' | 'discussion' | 'solutions' | 'submissions'>(() => {
    const savedTab = sessionStorage.getItem('solveProblemActiveTab');
    const savedId = sessionStorage.getItem('solveProblemActiveId');
    if (savedId === id && savedTab) {
      return (savedTab as any) || 'description';
    }
    return 'description';
  });

  useEffect(() => {
    if (id) {
      sessionStorage.setItem('solveProblemActiveId', id);
      sessionStorage.setItem('solveProblemActiveTab', activeTab);
    }
  }, [id, activeTab]);

  const [leftWidth, setLeftWidth] = useState<number>(50);
  const [isResizing, setIsResizing] = useState<boolean>(false);
  const [selectedLang, setSelectedLang] = useState<string>('Java');

  // Problem detail states
  const [problem, setProblem] = useState<ProblemDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const [codeHtml, setCodeHtml] = useState<string>('');

  useEffect(() => {
    if (!id) return;
    setLoading(true);
    problemService.fetchProblemDetail(id)
      .then(data => {
        setProblem(data);
        if (data.templates) {
          const defaultLang = Object.keys(data.templates)[0] || 'Java';
          setSelectedLang(defaultLang);
          setCodeHtml(data.source_code || data.templates[defaultLang] || '');
        }
        setLoading(false);
      })
      .catch(err => {
        setError(err.message);
        setLoading(false);
      });

    problemService.fetchProblemSubmissions(id)
      .then(data => {
        setSubmissions(data);
      })
      .catch(err => {
        console.error("Failed to load submissions:", err);
      });
  }, [id]);

  // Handle changing language
  const handleLangChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const lang = e.target.value;
    setSelectedLang(lang);
    if (problem && problem.templates) {
      const defaultCode = problem.templates[lang] || '';
      setCodeHtml(defaultCode);
      const editor = document.getElementById('code-editor');
      if (editor) {
        editor.innerHTML = defaultCode;
      }
    }
  };

  // Handle Reset Code
  const handleResetCode = () => {
    if (problem && problem.templates) {
      const defaultCode = problem.templates[selectedLang] || '';
      setCodeHtml(defaultCode);
      const editor = document.getElementById('code-editor');
      if (editor) {
        editor.innerHTML = defaultCode;
      }
    }
  };

  // Resizable logic
  const startResizing = (e: React.MouseEvent) => {
    setIsResizing(true);
    e.preventDefault();
  };

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!isResizing) return;
      const container = document.getElementById('split-container');
      if (!container) return;
      const containerRect = container.getBoundingClientRect();
      let newLeftWidth = ((e.clientX - containerRect.left) / containerRect.width) * 100;
      if (newLeftWidth < 20) newLeftWidth = 20;
      if (newLeftWidth > 80) newLeftWidth = 80;
      setLeftWidth(newLeftWidth);
    };

    const handleMouseUp = () => {
      setIsResizing(false);
    };

    if (isResizing) {
      window.addEventListener('mousemove', handleMouseMove);
      window.addEventListener('mouseup', handleMouseUp);
    }

    return () => {
      window.removeEventListener('mousemove', handleMouseMove);
      window.removeEventListener('mouseup', handleMouseUp);
    };
  }, [isResizing]);

  // Comments state inside Discussion
  const [comments, setComments] = useState<ProblemComment[]>([]);
  const [commentText, setCommentText] = useState<string>('');
  const [activeReplyId, setActiveReplyId] = useState<number | null>(null);
  const [replyText, setReplyText] = useState<string>('');

  useEffect(() => {
    if (!id) return;
    problemService.fetchProblemComments(id)
      .then(data => {
        setComments(data);
      })
      .catch(err => {
        console.error("Failed to load comments:", err);
      });
  }, [id]);

  const handleAddComment = (e: React.FormEvent) => {
    e.preventDefault();
    if (!id || !commentText.trim()) return;

    problemService.postProblemComment(id, commentText)
      .then(newComment => {
        setComments([newComment, ...comments]);
        setCommentText('');
      })
      .catch(err => {
        alert(err.message || "Failed to post comment. Make sure you are logged in.");
      });
  };

  const getInitials = (name: string) => {
    if (!name) return 'ME';
    const parts = name.trim().split(/\s+/);
    if (parts.length >= 2) return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
    if (parts[0].length >= 2) return parts[0].substring(0, 2).toUpperCase();
    return parts[0][0].toUpperCase();
  };

  const getAvatarBg = (name: string) => {
    const bgs = ['bg-brand-blue', 'bg-brand-green', 'bg-orange-500', 'bg-purple-500', 'bg-red-500', 'bg-teal-500'];
    let hash = 0;
    for (let i = 0; i < (name || '').length; i++) hash = name.charCodeAt(i) + ((hash << 5) - hash);
    return bgs[Math.abs(hash) % bgs.length];
  };

  const formatHtmlText = (text: string | undefined | null) => {
    if (!text) return '';
    // Replace literal '\n' with '<br />' for HTML rendering
    return text.replace(/\\n/g, '<br />');
  };

  const formatPreText = (text: string | undefined | null) => {
    if (!text) return '';
    // Replace literal '\n' with actual newline for <pre> tags
    return text.replace(/\\n/g, '\n');
  };

  const handleAddReply = (parentId: number) => {
    if (!id || !replyText.trim()) return;

    problemService.postProblemComment(id, replyText, parentId)
      .then(newReply => {
        setComments(prevComments =>
          prevComments.map(c => {
            if (c.id === parentId) {
              return {
                ...c,
                replies: [...(c.replies || []), newReply]
              };
            }
            return c;
          })
        );
        setActiveReplyId(null);
        setReplyText('');
      })
      .catch(err => {
        alert(err.message || "Failed to post reply. Make sure you are logged in.");
      });
  };

  // Submissions list
  const [submissions, setSubmissions] = useState<any[]>([]);

  // Submit flow states
  const [isSubmitting, setIsSubmitting] = useState<boolean>(false);
  const [showSuccessOverlay, setShowSuccessOverlay] = useState<boolean>(false);
  const [submitResult, setSubmitResult] = useState<SubmitResponse | null>(null);

  const handleSubmit = () => {
    if (!id) return;
    setIsSubmitting(true);
    const editorElement = document.getElementById('code-editor');
    const sourceCode = editorElement ? (editorElement as HTMLElement).innerText : '';

    problemService.submitSolution(id, selectedLang, sourceCode)
      .then(result => {
        setIsSubmitting(false);
        setSubmitResult(result);
        if (result.verdict === 'ACCEPTED') {
          setShowSuccessOverlay(true);
          setProblem(prev => prev ? { ...prev, status: 'solved' } : null);
        } else if (problem && problem.status === 'unsolved') {
          setProblem(prev => prev ? { ...prev, status: 'attempted' } : null);
        }

        const now = new Date();
        const timestamp = now.toISOString().replace('T', ' ').substring(0, 19);
        setSubmissions([
          {
            status: result.verdict === 'ACCEPTED' ? 'Accepted' : result.verdict.replace(/_/g, ' '),
            lang: selectedLang,
            runtime: `${result.runtime.toFixed(1)} ms`,
            memory: `${(result.memory / 1024).toFixed(1)} MB`,
            time: timestamp,
            statusClass: result.verdict === 'ACCEPTED' ? 'text-brand-green' : 'text-red-600'
          },
          ...submissions
        ]);

        setActiveTab('submissions');
      })
      .catch(err => {
        setIsSubmitting(false);
        alert(err.message || 'Submission failed');
      });
  };

  const getTabClass = (tab: 'description' | 'discussion' | 'solutions' | 'submissions') => {
    return activeTab === tab
      ? "py-3 text-sm font-bold text-primary border-b-2 border-primary whitespace-nowrap outline-none"
      : "py-3 text-sm font-medium text-text-muted hover:text-text-main whitespace-nowrap border-b-2 border-transparent outline-none";
  };

  if (loading) {
    return (
      <div className="flex flex-col h-[calc(100vh-64px)] w-full items-center justify-center bg-surface-gray">
        <svg className="animate-spin h-10 w-10 text-primary mb-4" fill="none" viewBox="0 0 24 24">
          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
          <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
        </svg>
        <span className="text-text-muted font-semibold">Loading problem...</span>
      </div>
    );
  }

  if (error || !problem) {
    return (
      <div className="flex flex-col h-[calc(100vh-64px)] w-full items-center justify-center bg-surface-gray text-red-600">
        <span className="material-symbols-outlined text-[48px] mb-2">error</span>
        <span className="font-bold mb-2">Error Loading Problem</span>
        <span className="text-sm text-text-muted">{error || "Problem not found"}</span>
        <Link to="/problems" className="mt-4 bg-primary text-white px-4 py-2 rounded font-bold text-sm">Back to Problems</Link>
      </div>
    );
  }

  return (
    <div className="flex flex-col h-[calc(100vh-64px)] w-full mx-auto overflow-hidden bg-surface-gray">
      {/* Styles injected to ensure identical visual styling of Custom Scrollbars & Resizer */}
      <style dangerouslySetInnerHTML={{
        __html: `
        .resizer {
            width: 8px;
            cursor: col-resize;
            background-color: #e5e7eb;
            transition: background-color 0.2s;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10;
        }
        .resizer:hover, .resizer.dragging {
            background-color: #F36F21;
        }
        .resizer::after {
            content: "";
            display: block;
            width: 2px;
            height: 24px;
            background-color: #9ca3af;
            border-radius: 2px;
        }
        .resizer:hover::after, .resizer.dragging::after {
            background-color: #ffffff;
        }
        
        .hide-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .hide-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        /* Editor scrollbar */
        .custom-scroll::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        .custom-scroll::-webkit-scrollbar-track {
            background: #f8f9fa;
        }
        .custom-scroll::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 4px;
        }
        .custom-scroll::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }

        /* Hide details marker */
        details > summary {
            list-style: none;
        }
        details > summary::-webkit-details-marker {
            display: none;
        }
      `}} />

      {/* Success Modal overlay */}
      {showSuccessOverlay && submitResult && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-lg p-6 max-w-sm w-full border border-gray-200 text-center shadow-lg space-y-4 animate-fade-in">
            <span className="material-symbols-outlined text-[48px] text-brand-green">check_circle</span>
            <h3 className="font-bold text-lg text-text-main">Solution Accepted!</h3>
            <p className="text-sm text-text-muted">Your solution passed {submitResult.passedTestcases}/{submitResult.totalTestcases} test cases successfully.</p>
            <div className="bg-surface-gray p-3 rounded-md font-mono text-xs text-left space-y-1">
              <div><strong>Status:</strong> <span className="text-brand-green">Accepted</span></div>
              <div><strong>Language:</strong> {selectedLang}</div>
              <div><strong>Runtime:</strong> {submitResult.runtime.toFixed(1)} ms</div>
              <div><strong>Memory:</strong> {(submitResult.memory / 1024).toFixed(1)} MB</div>
            </div>
            <button
              onClick={() => setShowSuccessOverlay(false)}
              className="w-full py-2 bg-brand-green hover:bg-[#3d8c38] text-white rounded font-bold text-sm transition-colors"
            >
              Close
            </button>
          </div>
        </div>
      )}

      {/* Back button row */}
      <div className="px-4 py-2 bg-surface border-b border-gray-200 flex items-center justify-between shrink-0 h-12">
        <Link to="/problems" className="inline-flex items-center gap-2 text-text-muted hover:text-primary transition-colors text-sm font-medium group">
          <span className="material-symbols-outlined text-[20px] group-hover:-translate-x-1 transition-transform">arrow_back</span>
          Back to Problems
        </Link>
        <div className="flex items-center gap-4">
          {problem.status === 'solved' && (
            <span className="text-sm font-semibold text-brand-green flex items-center gap-1">
              <span className="material-symbols-outlined text-[18px]">check_circle</span> Solved
            </span>
          )}
          {problem.status === 'attempted' && (
            <span className="text-sm font-semibold text-red-600 flex items-center gap-1">
              <span className="material-symbols-outlined text-[18px]">cancel</span> Attempted
            </span>
          )}
          {problem.status === 'unsolved' && (
            <span className="text-sm font-semibold text-text-muted flex items-center gap-1">
              <span className="material-symbols-outlined text-[18px]">help_outline</span> Unsolved
            </span>
          )}
          <span className="text-sm font-medium text-text-muted border-l border-gray-300 pl-4">Acceptance: {problem.acceptance}</span>
        </div>
      </div>

      <div className="flex-grow flex h-[calc(100vh-112px)] overflow-hidden relative" id="split-container">
        {/* Left Pane */}
        <div id="left-pane" className="flex flex-col bg-surface border-r border-gray-200 overflow-hidden" style={{ width: `${leftWidth}%` }}>
          {/* Navbar */}
          <div className="flex items-center gap-6 px-4 bg-surface-gray border-b border-gray-200 shrink-0 overflow-x-auto hide-scrollbar">
            <button className={getTabClass('description')} onClick={() => setActiveTab('description')}>Description</button>
            <button className={getTabClass('discussion')} onClick={() => setActiveTab('discussion')}>Discussion</button>
            <button className={getTabClass('solutions')} onClick={() => setActiveTab('solutions')}>Solutions</button>
            <button className={getTabClass('submissions')} onClick={() => setActiveTab('submissions')}>Submissions</button>
          </div>

          {/* Tab Contents */}
          <div className="flex-grow overflow-y-auto p-6" id="tab-contents">
            {/* Description Tab */}
            {activeTab === 'description' && (
              <div id="tab-description" className="block space-y-6">
                <div className="flex items-center justify-between">
                  <h1 className="text-2xl font-bold text-text-main">{problem.id}. {problem.title}</h1>
                  <div className="flex items-center gap-2">
                    {problem.difficulty === 'Easy' && <span className="bg-green-50 border border-green-200 text-brand-green px-3 py-1 rounded-full text-xs font-bold">Easy</span>}
                    {problem.difficulty === 'Medium' && <span className="bg-orange-50 border border-orange-200 text-orange-500 px-3 py-1 rounded-full text-xs font-bold">Medium</span>}
                    {problem.difficulty === 'Hard' && <span className="bg-red-50 border border-red-200 text-red-600 px-3 py-1 rounded-full text-xs font-bold">Hard</span>}
                  </div>
                </div>

                <div className="space-y-4 text-base text-text-main leading-relaxed">
                  <div dangerouslySetInnerHTML={{ __html: formatHtmlText(problem.description) }} />

                  {problem.inputDescription && (
                    <div>
                      <h3 className="font-semibold text-lg mb-1 mt-4">Input Description</h3>
                      <div className="text-text-muted text-sm leading-relaxed" dangerouslySetInnerHTML={{ __html: formatHtmlText(problem.inputDescription) }} />
                    </div>
                  )}

                  {problem.outputDescription && (
                    <div>
                      <h3 className="font-semibold text-lg mb-1 mt-4">Output Description</h3>
                      <div className="text-text-muted text-sm leading-relaxed" dangerouslySetInnerHTML={{ __html: formatHtmlText(problem.outputDescription) }} />
                    </div>
                  )}
                </div>

                {(problem.exampleInput || problem.exampleOutput) && (
                  <div>
                    <h3 className="font-semibold text-lg mb-3">Example:</h3>
                    <div className="bg-surface-gray rounded-lg p-4 font-mono text-sm border border-gray-200 space-y-2">
                      {problem.exampleInput && <div><span className="font-bold text-brand-blue">Input:</span><pre className="whitespace-pre-wrap">{formatPreText(problem.exampleInput)}</pre></div>}
                      {problem.exampleOutput && <div className="mt-2"><span className="font-bold text-brand-blue">Output:</span><pre className="whitespace-pre-wrap">{formatPreText(problem.exampleOutput)}</pre></div>}
                    </div>
                  </div>
                )}

                {problem.constraints && (
                  <div>
                    <h3 className="font-semibold text-lg mb-3">Constraints:</h3>
                    <div className="list-disc list-inside space-y-2 text-text-main bg-surface-gray p-4 rounded-lg border border-gray-200 font-mono text-sm" dangerouslySetInnerHTML={{ __html: problem.constraints }} />
                  </div>
                )}

                {problem.hint && (
                  <details className="group bg-surface-gray rounded-lg border border-gray-200">
                    <summary className="flex items-center justify-between p-4 cursor-pointer font-semibold text-brand-blue">
                      Show Hint
                      <span className="material-symbols-outlined transition-transform group-open:rotate-180">expand_more</span>
                    </summary>
                    <div className="p-4 border-t border-gray-200 text-text-muted text-sm leading-relaxed bg-surface" dangerouslySetInnerHTML={{ __html: problem.hint }} />
                  </details>
                )}
              </div>
            )}

            {/* Discussion Tab */}
            {activeTab === 'discussion' && (
              <div id="tab-discussion" className="block space-y-6">
                <div className="flex justify-between items-center">
                  <h2 className="text-xl font-bold text-brand-blue">Discussion</h2>
                </div>

                {/* Comment Input Box */}
                <form onSubmit={handleAddComment} className="bg-surface border border-gray-200 rounded-lg p-4 shadow-sm flex gap-3">
                  {user && user.avatar ? (
                    <img src={user.avatar} alt={user.name} className="w-10 h-10 rounded-full object-cover shrink-0" />
                  ) : (
                    <div className="w-10 h-10 rounded-full bg-brand-blue flex items-center justify-center text-white text-xs font-bold shrink-0">ME</div>
                  )}
                  <div className="flex-grow space-y-2">
                    {user && <div className="font-bold text-sm text-text-main mb-1">{user.name}</div>}
                    <textarea
                      className="w-full bg-surface-gray border border-gray-200 rounded-lg p-2 text-sm text-text-main focus:ring-primary focus:border-primary outline-none resize-none"
                      rows={2}
                      placeholder="Write a comment..."
                      value={commentText}
                      onChange={(e) => setCommentText(e.target.value)}
                    ></textarea>
                    <div className="flex justify-end">
                      <button type="submit" className="bg-primary hover:bg-primary-hover text-white px-4 py-1.5 rounded-lg text-xs font-bold transition-colors shadow-sm active:scale-95">Comment</button>
                    </div>
                  </div>
                </form>

                {/* Comments List */}
                <div className="space-y-4">
                  {comments.map((comment) => (
                    <div key={comment.id} className="border border-gray-200 rounded-lg p-4 bg-surface space-y-3 shadow-sm">
                      <div className="flex items-center gap-3">
                        {comment.avatar_url ? (
                          <img src={comment.avatar_url} alt={comment.author} className="w-10 h-10 rounded-full object-cover shrink-0" />
                        ) : (
                          <div className={`w-10 h-10 rounded-full ${getAvatarBg(comment.author)} flex items-center justify-center text-white text-sm font-bold shrink-0`}>
                            {getInitials(comment.author)}
                          </div>
                        )}
                        <div>
                          <div className="font-bold text-sm text-text-main">{comment.author}</div>
                          <div className="text-xs text-text-muted">{comment.time}</div>
                        </div>
                      </div>
                      <p className="text-sm text-text-main">{comment.text}</p>
                      <div className="flex gap-4 text-text-muted text-sm font-medium">
                        <button
                          onClick={() => {
                            if (activeReplyId === comment.id) {
                              setActiveReplyId(null);
                            } else {
                              setActiveReplyId(comment.id);
                              setReplyText('');
                            }
                          }}
                          className="flex items-center gap-1 hover:text-primary transition-colors text-xs font-bold"
                        >
                          <span className="material-symbols-outlined text-[16px]">reply</span> Reply
                        </button>
                      </div>

                      {/* Reply Input Box */}
                      {activeReplyId === comment.id && (
                        <div className="mt-3 pl-4 border-l-2 border-primary/40 space-y-2">
                          <textarea
                            className="w-full bg-surface-gray border border-gray-200 rounded-lg p-2 text-xs text-text-main focus:ring-primary focus:border-primary outline-none resize-none"
                            rows={2}
                            placeholder="Write a reply..."
                            value={replyText}
                            onChange={(e) => setReplyText(e.target.value)}
                          />
                          <div className="flex justify-end gap-2">
                            <button
                              onClick={() => setActiveReplyId(null)}
                              className="px-3 py-1 text-xs font-semibold text-text-muted hover:text-text-main transition-colors"
                            >
                              Cancel
                            </button>
                            <button
                              onClick={() => handleAddReply(comment.id)}
                              className="bg-primary hover:bg-primary-hover text-white px-3 py-1 rounded-md text-xs font-bold transition-colors shadow-sm"
                            >
                              Post Reply
                            </button>
                          </div>
                        </div>
                      )}

                      {comment.replies && comment.replies.map((reply) => (
                        <div key={reply.id} className="ml-10 mt-3 pl-4 border-l-2 border-primary space-y-3">
                          <div className="flex items-center gap-3">
                            {reply.avatar_url ? (
                              <img src={reply.avatar_url} alt={reply.author} className="w-8 h-8 rounded-full object-cover shrink-0" />
                            ) : (
                              <div className={`w-8 h-8 rounded-full ${getAvatarBg(reply.author)} flex items-center justify-center text-white text-xs font-bold shrink-0`}>
                                {getInitials(reply.author)}
                              </div>
                            )}
                            <div>
                              <div className="font-bold text-sm text-text-main">{reply.author}</div>
                              <div className="text-xs text-text-muted">{reply.time}</div>
                            </div>
                          </div>
                          <p className="text-sm text-text-main">{reply.text}</p>
                        </div>
                      ))}
                    </div>
                  ))}
                  {comments.length === 0 && (
                    <div className="p-8 text-center text-text-muted border border-dashed border-gray-200 rounded-lg bg-surface">
                      No comments yet. Be the first to start the discussion!
                    </div>
                  )}
                </div>
              </div>
            )}

            {/* Solutions Tab */}
            {activeTab === 'solutions' && (
              <div id="tab-solutions" className="block space-y-6">
                <h2 className="text-xl font-bold text-brand-blue">Solutions</h2>
                {problem && problem.status === 'solved' ? (
                  <div className="border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                    <div className="bg-surface-gray px-4 py-3 border-b border-gray-200 flex justify-between items-center">
                      <div className="flex items-center gap-2">
                        <span className="material-symbols-outlined text-brand-green">check_circle</span>
                        <span className="font-bold text-text-main">Java - One Pass HashMap</span>
                      </div>
                      <span className="text-sm text-text-muted">By Jane Smith</span>
                    </div>
                    <div className="p-4 bg-white text-gray-800 font-mono text-sm overflow-x-auto custom-scroll">
                      <pre>
                        <code>
                          <span className="text-purple-600">class</span> <span className="text-teal-600">Solution</span> {'{\n'}
                          {'    '}<span className="text-purple-600">public</span> <span className="text-blue-600">int</span>[] <span className="text-blue-600">twoSum</span>(<span className="text-blue-600">int</span>[] <span className="text-sky-600">nums</span>, <span className="text-blue-600">int</span> <span className="text-sky-600">target</span>) {'{\n'}
                          {'        '}<span className="text-teal-600">Map</span>&lt;<span className="text-teal-600">Integer</span>, <span className="text-teal-600">Integer</span>&gt; <span className="text-sky-600">map</span> = <span className="text-purple-600">new</span> <span className="text-teal-600">HashMap</span>&lt;&gt;();{"\n"}
                          {'        '}<span className="text-purple-600">for</span> (<span className="text-blue-600">int</span> <span className="text-sky-600">i</span> = <span className="text-orange-600">0</span>; <span className="text-sky-600">i</span> &lt; <span className="text-sky-600">nums</span>.length; <span className="text-sky-600">i</span>++) {'{\n'}
                          {'            '}<span className="text-blue-600">int</span> <span className="text-sky-600">complement</span> = <span className="text-sky-600">target</span> - <span className="text-sky-600">nums</span>[<span className="text-sky-600">i</span>];{"\n"}
                          {'            '}<span className="text-purple-600">if</span> (<span className="text-sky-600">map</span>.<span className="text-blue-600">containsKey</span>(<span className="text-sky-600">complement</span>)) {'{\n'}
                          {'                '}<span className="text-purple-600">return</span> <span className="text-purple-600">new</span> <span className="text-blue-600">int</span>[] {'{'} <span className="text-sky-600">map</span>.<span className="text-blue-600">get</span>(<span className="text-sky-600">complement</span>), <span className="text-sky-600">i</span> {'}'};{"\n"}
                          {'            '}{'}\n'}
                          {'            '}<span className="text-sky-600">map</span>.<span className="text-blue-600">put</span>(<span className="text-sky-600">nums</span>[<span className="text-sky-600">i</span>], <span className="text-sky-600">i</span>);{"\n"}
                          {'        '}{'}\n'}
                          {'        '}<span className="text-purple-600">return</span> <span className="text-purple-600">new</span> <span className="text-blue-600">int</span>[] {'{}'};{"\n"}
                          {'    '}{'}\n'}
                          {'}'}
                        </code>
                      </pre>
                    </div>
                  </div>
                ) : (
                  <div className="border border-outline-variant/60 rounded-xl bg-surface-gray/30 p-8 text-center flex flex-col items-center justify-center min-h-[300px] border-dashed">
                    <div className="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center text-primary mb-4 animate-pulse">
                      <span className="material-symbols-outlined text-[32px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>lock</span>
                    </div>
                    <h3 className="text-headline-sm font-bold text-text-main mb-2">Solution Locked</h3>
                    <p className="text-body-md text-text-muted max-w-md mb-6">
                      To view the author's official solution and optimal approaches, you must first solve this problem and pass all test cases.
                    </p>
                    <button
                      onClick={() => setActiveTab('description')}
                      className="px-6 py-2 bg-primary hover:bg-primary-hover text-white text-sm font-bold rounded-lg transition-colors shadow-sm active:scale-95 flex items-center gap-1.5"
                    >
                      <span className="material-symbols-outlined text-[18px]">keyboard_backspace</span> Back to Description
                    </button>
                  </div>
                )}
              </div>
            )}

            {/* Submissions Tab */}
            {activeTab === 'submissions' && (
              <div id="tab-submissions" className="block space-y-6">
                <div className="flex items-center justify-between">
                  <h2 className="text-xl font-bold text-brand-blue">Submissions</h2>
                </div>
                <div className="bg-surface border border-gray-200 rounded-lg overflow-hidden shadow-sm">
                  <div className="overflow-x-auto custom-scroll">
                    <table className="w-full text-left border-collapse whitespace-nowrap min-w-[600px]">
                      <thead>
                        <tr className="bg-surface-gray border-b border-gray-200 text-text-muted text-xs font-bold uppercase tracking-wider">
                          <th className="p-4 w-1/3">Status</th>
                          <th className="p-4">Language</th>
                          <th className="p-4">Runtime</th>
                          <th className="p-4">Memory</th>
                          <th className="p-4 text-right">Time Submitted</th>
                        </tr>
                      </thead>
                      <tbody className="text-sm font-medium text-text-main divide-y divide-gray-100">
                        {submissions.map((sub, sIdx) => (
                          <tr key={sIdx} className="hover:bg-surface-gray/50 transition-colors cursor-pointer group">
                            <td className="p-4">
                              <span className={`${sub.statusClass} font-bold group-hover:underline`}>{sub.status}</span>
                            </td>
                            <td className="p-4 text-text-muted">{sub.lang}</td>
                            <td className="p-4">{sub.runtime}</td>
                            <td className="p-4">{sub.memory}</td>
                            <td className="p-4 text-right text-text-muted">{sub.time}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            )}


          </div>
        </div>

        {/* Resizer */}
        <div
          id="resizer"
          className={`resizer shrink-0 ${isResizing ? 'dragging' : ''}`}
          title="Drag to resize"
          onMouseDown={startResizing}
        ></div>

        {/* Right Pane */}
        <div id="right-pane" className="flex flex-col bg-surface border-l border-gray-200 overflow-hidden relative" style={{ width: `${100 - leftWidth}%` }}>
          {/* Editor Header */}
          <div className="flex items-center justify-between p-2 bg-surface border-b border-gray-200 shrink-0">
            <div className="flex items-center gap-2">
              <select
                value={selectedLang}
                onChange={handleLangChange}
                className="bg-surface-gray border border-gray-300 text-text-main text-sm rounded-md focus:ring-primary focus:border-primary block px-3 py-1.5 font-medium cursor-pointer outline-none"
              >
                {problem.templates && Object.keys(problem.templates).map(lang => (
                  <option key={lang} value={lang}>{lang}</option>
                ))}
              </select>
            </div>
            <div className="flex gap-1 text-text-muted">
              <button
                onClick={handleResetCode}
                aria-label="Reset Code"
                className="p-1.5 hover:bg-surface-gray rounded transition-colors text-text-main hover:text-primary"
                title="Reset Code"
              >
                <span className="material-symbols-outlined text-[20px]">refresh</span>
              </button>
            </div>
          </div>

          {/* Editor Area (White theme) */}
          <div className="flex-grow flex overflow-y-auto custom-scroll text-[15px] leading-relaxed font-mono text-gray-800 bg-white">
            {/* Line Numbers */}
            <div className="w-12 flex flex-col items-end py-4 pr-3 text-gray-400 bg-surface-gray border-r border-gray-200 select-none shrink-0">
              {Array.from({ length: Math.max(15, codeHtml.split(/\r?\n|<br\/?>/gi).length) }, (_, i) => (
                <span key={i + 1}>{i + 1}</span>
              ))}
            </div>
            {/* Code */}
            <div
              id="code-editor"
              className="flex-grow py-4 pl-4 overflow-x-auto custom-scroll whitespace-pre outline-none"
              contentEditable={true}
              suppressContentEditableWarning={true}
              spellCheck={false}
              dangerouslySetInnerHTML={{ __html: codeHtml }}
              onBlur={(e) => setCodeHtml(e.currentTarget.innerHTML)}
            />
          </div>

          {/* Action Bar (Removed Run Code, kept Submit) */}
          <div className="p-3 bg-surface border-t border-gray-200 flex justify-end gap-3 shrink-0">
            <button
              onClick={handleSubmit}
              disabled={isSubmitting}
              className="px-8 py-2 bg-brand-green hover:bg-[#3d8c38] text-white rounded-lg font-bold transition-colors shadow-sm text-sm active:scale-95 disabled:bg-gray-400 flex items-center justify-center gap-2"
            >
              {isSubmitting ? (
                <>
                  <svg className="animate-spin h-4 w-4 text-white" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                  </svg>
                  Submitting...
                </>
              ) : (
                'Submit'
              )}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
