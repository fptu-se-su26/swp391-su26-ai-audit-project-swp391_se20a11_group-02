import React, { useRef, useEffect } from 'react';
import { useAiVisualizer } from '../hooks/useAiVisualizer';

interface AiVisualizerPanelProps {
    problemRequest: any;
}

const AiVisualizerPanel: React.FC<AiVisualizerPanelProps> = ({ problemRequest }) => {
    const { isLoading, data, error, jobStatus, generate, regenerate, checkCache } = useAiVisualizer();
    const iframeRef = useRef(null);

    useEffect(() => {
        if (problemRequest && problemRequest.problemId) {
            checkCache(problemRequest.problemId);
        }
    }, [problemRequest?.problemId, checkCache]);

    const handleGenerate = () => {
        generate(problemRequest);
    };

    const handleRegenerate = () => {
        regenerate(problemRequest);
    };

    const handleSpeedChange = (e: any) => {
        const speed = parseInt(e.target.value, 10);
        // postMessage to iframe to adjust delay
        if (iframeRef.current && (iframeRef.current as HTMLIFrameElement).contentWindow) {
            (iframeRef.current as HTMLIFrameElement).contentWindow!.postMessage({ type: 'SET_SPEED', value: speed }, '*');
        }
    };

    return (
        <div className="p-4 bg-gray-800 rounded-xl shadow-lg text-white">
            {!isLoading && !data && !error && (
                <div className="flex flex-col items-center justify-center p-8 space-y-4">
                    <p className="text-gray-300 text-center max-w-md">
                        Want to see how this algorithm works? AI can analyze and simulate it step-by-step for you.
                    </p>
                    <button
                        onClick={handleGenerate}
                        disabled={isLoading}
                        className="px-6 py-3 bg-blue-600 hover:bg-blue-500 rounded-lg font-bold transition-all shadow-md flex items-center space-x-2"
                    >
                        <span>🤖 Ask AI to Simulate Algorithm</span>
                    </button>
                </div>
            )}

            {isLoading && (
                <div className="flex flex-col items-center justify-center p-12 space-y-4 animate-pulse">
                    <div className="w-12 h-12 border-4 border-blue-500 border-t-transparent rounded-full animate-spin"></div>
                    <p className="text-yellow-400 font-semibold text-lg">AI is analyzing the problem and generating the simulation... Please wait</p>
                    <p className="text-gray-400 text-sm">(Usually takes about 15-30 seconds)</p>
                </div>
            )}

            {error && !isLoading && (
                <div className="flex flex-col items-center p-8 space-y-4 border border-red-500 bg-red-900/20 rounded-lg">
                    <p className="text-red-400 text-lg text-center font-medium">{error}</p>
                    <button
                        onClick={handleGenerate}
                        className="px-4 py-2 bg-red-600 hover:bg-red-500 rounded-lg font-semibold transition"
                    >
                        Try again
                    </button>
                </div>
            )}

            {data && !isLoading && (
                <div className="flex flex-col space-y-4">
                    <div className="flex flex-wrap items-center justify-between gap-4">
                        <div className="flex space-x-2">
                            <span className="px-3 py-1 bg-green-900 text-green-300 border border-green-500 rounded-full text-sm font-bold">
                                🚀 Algorithm: {data.detectedAlgorithm}
                            </span>
                            <span className="px-3 py-1 bg-purple-900 text-purple-300 border border-purple-500 rounded-full text-sm font-bold">
                                ⏱ O-Big: {data.timeComplexity}
                            </span>
                            {data.fromCache && (
                                <span className="px-3 py-1 bg-gray-700 text-gray-300 border border-gray-500 rounded-full text-sm">
                                    ⚡ From cache
                                </span>
                            )}
                        </div>
                        <div className="flex items-center space-x-4">
                            <div className="flex items-center space-x-2 text-sm">
                                <label htmlFor="speedSlider" className="text-gray-400">Speed:</label>
                                <input 
                                    id="speedSlider"
                                    type="range" 
                                    min="50" max="2000" step="50" defaultValue="500" 
                                    onChange={handleSpeedChange} 
                                    className="accent-blue-500"
                                    style={{ direction: 'rtl' }} // Reverse direction for speed mapping
                                />
                            </div>
                            <button
                                onClick={handleRegenerate}
                                className="px-4 py-2 bg-gray-700 hover:bg-gray-600 rounded-lg text-sm transition"
                            >
                                🔄 Generate another simulation
                            </button>
                        </div>
                    </div>

                    <div className="w-full h-[600px] border-none rounded-lg bg-gray-900 overflow-hidden relative shadow-inner">
                        <iframe
                            ref={iframeRef}
                            srcDoc={data.htmlContent}
                            sandbox="allow-scripts"
                            className="w-full h-full"
                            title="AI Visualizer"
                        />
                    </div>
                </div>
            )}
        </div>
    );
};

export default AiVisualizerPanel;
