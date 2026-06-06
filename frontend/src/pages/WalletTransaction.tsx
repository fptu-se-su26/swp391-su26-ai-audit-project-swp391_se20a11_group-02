import React, { useState, useEffect, useRef } from 'react';
import { Link } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { paymentService } from '../services/paymentService';

const TX_TYPE_OPTIONS = [
  { value: '', label: 'All Types', bg: 'bg-gray-100 text-gray-700' },
  { value: 'DEPOSIT', label: 'Deposit', bg: 'bg-blue-100 text-blue-700' },
  { value: 'BUY_COURSE', label: 'Buy Course', bg: 'bg-red-100 text-red-700' },
  { value: 'REFUND', label: 'Refund', bg: 'bg-purple-100 text-purple-700' },
  { value: 'AWARD', label: 'Award', bg: 'bg-amber-100 text-amber-700' }
];

export const WalletTransaction: React.FC = () => {
  const { user, refreshBalance } = useApp();

  // Wallet Transactions States
  const [walletTransactions, setWalletTransactions] = useState<any[]>([]);
  const [walletTxPage, setWalletTxPage] = useState<number>(0);
  const [walletTxTotalPages, setWalletTxTotalPages] = useState<number>(1);
  const [walletTxTotalElements, setWalletTxTotalElements] = useState<number>(0);
  const [isWalletTxLoading, setIsWalletTxLoading] = useState<boolean>(false);
  const [selectedTxType, setSelectedTxType] = useState<string>('');

  const [isTxTypeDropdownOpen, setIsTxTypeDropdownOpen] = useState(false);
  const txTypeDropdownRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (txTypeDropdownRef.current && !txTypeDropdownRef.current.contains(event.target as Node)) {
        setIsTxTypeDropdownOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  useEffect(() => {
    if (user) {
      refreshBalance().catch(console.error);
    }
  }, [user?.id]);

  // Fetch Wallet Transactions
  useEffect(() => {
    if (user) {
      setIsWalletTxLoading(true);
      paymentService.getWalletTransactions(walletTxPage, 10, selectedTxType)
        .then(res => {
          setWalletTransactions(res.content || []);
          setWalletTxTotalPages(res.totalPages || 1);
          setWalletTxTotalElements(res.totalElements || 0);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        })
        .catch(console.error)
        .finally(() => setIsWalletTxLoading(false));
    }
  }, [user, walletTxPage, selectedTxType]);

  return (
    <div className="flex-grow max-w-[1280px] w-full mx-auto px-6 md:px-16 py-12 flex flex-col gap-8 text-left relative z-10">
      {/* Navigation & Balance Row */}
      <div className="flex flex-col md:flex-row justify-between items-center border-b border-gray-200 mb-2 pb-2 md:pb-0 gap-4">
        <div className="flex h-12 gap-6 overflow-x-auto whitespace-nowrap w-full md:w-auto">
          <Link className="text-primary font-bold border-b-2 border-primary h-full flex items-center text-sm" to="/wallet-transaction">Wallet Transaction</Link>
          <Link className="text-text-muted hover:text-primary transition-colors h-full flex items-center text-sm" to="/dashboard#deposit">Deposit</Link>
          <Link className="text-text-muted hover:text-primary transition-colors h-full flex items-center text-sm" to="/payment-transaction">Payment Transaction</Link>
        </div>
        <div className="bg-white py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.06)] flex items-center gap-3 min-w-[250px] mb-2 md:mb-0 shrink-0 border border-gray-200">
          <div className="w-9 h-9 rounded-full bg-green-50 flex items-center justify-center text-green-600">
            <span className="material-symbols-outlined text-xl icon-fill">account_balance_wallet</span>
          </div>
          <div>
            <p className="text-[11px] text-text-muted uppercase tracking-wider font-semibold">Current Balance</p>
            <p className="text-[17px] font-bold text-green-600 font-mono leading-none mt-0.5">{user?.walletBalance?.toLocaleString('vi-VN') || 0} ₫</p>
          </div>
        </div>
      </div>

      {/* Wallet Transactions Table */}
      <div className="bg-white rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.08)] overflow-hidden border border-gray-200 mb-12">
        <div className="p-6 border-b border-gray-200 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
          <div>
            <h2 className="text-xl font-bold text-brand-blue">Internal Transactions</h2>
            <p className="text-sm text-text-muted mt-1">History of course purchases, contest rewards, and other platform activities.</p>
          </div>
          <div className="flex items-center gap-2 shrink-0 relative" ref={txTypeDropdownRef}>
            <span className="text-sm font-semibold text-text-muted">Filter Type:</span>
            <button
              type="button"
              onClick={() => setIsTxTypeDropdownOpen(!isTxTypeDropdownOpen)}
              className="flex items-center justify-between gap-2 bg-white border border-gray-300 rounded-lg px-3 py-2 min-w-[170px] hover:border-primary transition-all text-sm font-semibold text-text-main shadow-sm cursor-pointer outline-none"
            >
              <span className={`text-xs px-2.5 py-1 rounded-full font-semibold ${TX_TYPE_OPTIONS.find(o => o.value === selectedTxType)?.bg || 'bg-gray-100 text-gray-700'}`}>
                {TX_TYPE_OPTIONS.find(o => o.value === selectedTxType)?.label || 'All Types'}
              </span>
              <span className="material-symbols-outlined text-text-muted text-lg transition-transform duration-200" style={{ transform: isTxTypeDropdownOpen ? 'rotate(180deg)' : 'none' }}>
                keyboard_arrow_down
              </span>
            </button>

            {isTxTypeDropdownOpen && (
              <div className="absolute right-0 top-full mt-1.5 w-48 bg-white border border-gray-200 rounded-lg shadow-lg py-1.5 z-50 animate-fade-in flex flex-col gap-1">
                {TX_TYPE_OPTIONS.map((opt) => (
                  <button
                    key={opt.value}
                    type="button"
                    onClick={() => {
                      setSelectedTxType(opt.value);
                      setWalletTxPage(0);
                      setIsTxTypeDropdownOpen(false);
                    }}
                    className="w-full flex items-center px-3 py-1.5 hover:bg-gray-50 transition-colors text-left border-none cursor-pointer bg-transparent"
                  >
                    <span className={`text-xs px-2.5 py-1 rounded-full font-semibold ${opt.bg}`}>
                      {opt.label}
                    </span>
                  </button>
                ))}
              </div>
            )}
          </div>
        </div>
        <div className="overflow-x-auto min-h-[530px]">
          <table className="w-full text-left border-collapse min-w-[800px]">
            <thead>
              <tr className="bg-gray-50 border-b border-gray-200 text-text-muted text-xs uppercase tracking-wider">
                <th className="p-4 pl-6 font-semibold">Date</th>
                <th className="p-4 font-semibold">Type</th>
                <th className="p-4 font-semibold text-right">Amount</th>
                <th className="p-4 font-semibold text-right">Status</th>
              </tr>
            </thead>
            <tbody className="text-sm text-text-main divide-y divide-gray-200">
              {isWalletTxLoading ? (
                <tr>
                  <td colSpan={4} className="p-8 text-center text-text-muted font-normal">
                    Loading transactions...
                  </td>
                </tr>
              ) : walletTransactions.length === 0 ? (
                <tr>
                  <td colSpan={4} className="p-8 text-center text-text-muted font-normal">
                    No transactions found.
                  </td>
                </tr>
              ) : (
                walletTransactions.map((tx, index) => {
                  const isAddition = ['DEPOSIT', 'AWARD', 'REFUND'].includes(tx.type);

                  const renderTypeBadge = (type: string) => {
                    switch (type) {
                      case 'DEPOSIT':
                        return <span className="bg-blue-100 text-blue-700 text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-semibold">Deposit</span>;
                      case 'BUY_COURSE':
                        return <span className="bg-red-100 text-red-700 text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-semibold">Buy Course</span>;
                      case 'REFUND':
                        return <span className="bg-purple-100 text-purple-700 text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-semibold">Refund</span>;
                      case 'AWARD':
                        return <span className="bg-amber-100 text-amber-700 text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-semibold">Award</span>;
                      default:
                        return <span className="bg-gray-100 text-gray-700 text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-semibold">{type}</span>;
                    }
                  };

                  const renderStatus = (status: string) => {
                    switch (status) {
                      case 'SUCCESS':
                        return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-green-600">check_circle</span> Completed</span>;
                      case 'FAILED':
                        return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-red-600">cancel</span> Failed</span>;
                      case 'PENDING':
                      default:
                        return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-yellow-600">hourglass_empty</span> Pending</span>;
                    }
                  };

                  return (
                    <tr key={index} className="hover:bg-gray-50/50 transition-colors">
                      <td className="p-4 pl-6 whitespace-nowrap text-text-muted font-normal">
                        {new Date(tx.date).toLocaleString('en-US', { day: 'numeric', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' })}
                      </td>
                      <td className="p-4">{renderTypeBadge(tx.type)}</td>
                      <td className={`p-4 text-right font-bold ${isAddition ? 'text-brand-green' : 'text-red-600'}`}>
                        {isAddition ? '+' : '-'}{tx.amount.toLocaleString('vi-VN')} ₫
                      </td>
                      <td className="p-4 text-right">{renderStatus(tx.status)}</td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
        <div className="p-4 border-t border-gray-200 flex items-center justify-between bg-white">
          <span className="text-sm text-text-muted">
            Showing {walletTransactions.length > 0 ? walletTxPage * 10 + 1 : 0} to {walletTxPage * 10 + walletTransactions.length} of {walletTxTotalElements} entries
          </span>
          <div className="flex gap-1">
            <button 
              type="button"
              disabled={walletTxPage === 0}
              onClick={(e) => {
                e.preventDefault();
                setWalletTxPage(prev => Math.max(prev - 1, 0));
              }}
              className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
            >
              <span className="material-symbols-outlined text-sm">chevron_left</span>
            </button>
            {Array.from({ length: walletTxTotalPages }, (_, i) => (
              <button 
                type="button"
                key={i}
                onClick={(e) => {
                  e.preventDefault();
                  setWalletTxPage(i);
                }}
                className={`w-8 h-8 rounded flex items-center justify-center text-sm font-medium ${walletTxPage === i ? 'bg-primary text-white' : 'border border-gray-200 text-text-muted hover:bg-gray-100 hover:text-primary'}`}
              >
                {i + 1}
              </button>
            ))}
            <button 
              type="button"
              disabled={walletTxPage >= walletTxTotalPages - 1}
              onClick={(e) => {
                e.preventDefault();
                setWalletTxPage(prev => Math.min(prev + 1, walletTxTotalPages - 1));
              }}
              className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none"
            >
              <span className="material-symbols-outlined text-sm">chevron_right</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
