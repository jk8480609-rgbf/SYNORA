import React from 'react';
import {createRoot} from 'react-dom/client';
import {LayoutDashboard,Users,Images,Shield,Settings,Bell,Search,MoreHorizontal,Activity} from 'lucide-react';
import './style.css';
function App(){
 const [tab,setTab]=React.useState('Overview');
 const nav=[['Overview',LayoutDashboard],['Users',Users],['Content',Images],['Reports',Shield],['Notifications',Bell],['Settings',Settings]];
 return <div className="app"><aside><div className="brand"><b>S</b><span>SYNORA</span></div><small>SUPER ADMIN</small>{nav.map(([n,I])=><button className={tab===n?'active':''} onClick={()=>setTab(n)}><I size={18}/>{n}</button>)}<div className="admin"><div className="avatar">A</div><div><b>Administrator</b><small>Super Admin</small></div></div></aside><main><header><div><small>CONTROL CENTER / {tab.toUpperCase()}</small><h1>{tab}</h1></div><div className="right"><Search/><Bell/><span className="avatar">A</span></div></header>{tab==='Overview'?<><section className="stats">{[['Total users','0','Users'],['Posts','0','Images'],['Active today','0','Activity'],['Open reports','0','Shield']].map(([a,b,I])=><article><small>{a}</small><h2>{b}</h2><span>Demo data</span></article>)}</section><section className="panel"><h3>Platform overview</h3><div className="empty"><Activity size={38}/><p>Connect your secure backend to display live SYNORA activity.</p></div></section></>:<section className="panel"><h3>{tab} management</h3><p>This section is a starter interface. Connect role-protected backend APIs to manage real {tab.toLowerCase()}.</p><div className="empty"><Shield size={38}/><p>No live data connected</p></div></section>}<footer>SYNORA Admin • Starter prototype • Secure backend required</footer></main></div>
}
createRoot(document.getElementById('root')).render(<App/>);
