<template>
    <div class="patent-stats-container">
      <!-- 专利分类统计部分 -->
      <div class="patent-stat-section">
        <div class="section-header">
          <div class="title-box">
            <div class="title-decoration left"></div>
            <span class="dot"></span>
            <span class="title-text">专利分类统计</span>
            <span class="dot"></span>
            <div class="title-decoration right"></div>
          </div>
        </div>
        <div class="stat-cards">
          <div class="stat-card">
            <div class="card-label">发明专利总量</div>
            <div class="card-value">
              <div class="value-box">
                <div class="value-border-top"></div>
                <div class="value-border-right"></div>
                <div class="value-border-bottom"></div>
                <div class="value-border-left"></div>
                <div class="value-corner top-left"></div>
                <div class="value-corner top-right"></div>
                <div class="value-corner bottom-left"></div>
                <div class="value-corner bottom-right"></div>
                <span class="number">123.00</span>
                <div class="value-bg"></div>
                <div class="value-light"></div>
              </div>
              <div class="card-shadow"></div>
            </div>
          </div>
          <div class="stat-card">
            <div class="card-label">实用新型总量</div>
            <div class="card-value">
              <div class="value-box">
                <div class="value-border-top"></div>
                <div class="value-border-right"></div>
                <div class="value-border-bottom"></div>
                <div class="value-border-left"></div>
                <div class="value-corner top-left"></div>
                <div class="value-corner top-right"></div>
                <div class="value-corner bottom-left"></div>
                <div class="value-corner bottom-right"></div>
                <span class="number">123.00</span>
                <div class="value-bg"></div>
                <div class="value-light"></div>
              </div>
              <div class="card-shadow"></div>
            </div>
          </div>
          <div class="stat-card">
            <div class="card-label">外观设计总量</div>
            <div class="card-value">
              <div class="value-box">
                <div class="value-border-top"></div>
                <div class="value-border-right"></div>
                <div class="value-border-bottom"></div>
                <div class="value-border-left"></div>
                <div class="value-corner top-left"></div>
                <div class="value-corner top-right"></div>
                <div class="value-corner bottom-left"></div>
                <div class="value-corner bottom-right"></div>
                <span class="number">123.00</span>
                <div class="value-bg"></div>
                <div class="value-light"></div>
              </div>
              <div class="card-shadow"></div>
            </div>
          </div>
        </div>
      </div>
  
      <!-- 专利授权数量部分 -->
      <div class="patent-grant-section">
        <div class="section-header">
          <div class="title-box">
            <div class="title-decoration left"></div>
            <span class="dot"></span>
            <span class="title-text">当年专利授权数量</span>
            <span class="dot"></span>
            <div class="title-decoration right"></div>
          </div>
        </div>
        
        <div class="total-count">
          <div class="count-value">12</div>
        </div>
  
        <div class="grant-stats">
          <div class="stat-item">
            <div class="progress-ring">
              <svg viewBox="0 0 100 100">
                <circle class="progress-ring-bg" cx="50" cy="50" r="45"/>
                <circle class="progress-ring-circle" cx="50" cy="50" r="45" 
                  :style="{ strokeDashoffset: calculateOffset(87.22) }"/>
              </svg>
              <div class="progress-text">
                <span class="value">87.22</span>
                <span class="unit">%</span>
              </div>
            </div>
            <div class="stat-label">发明专利</div>
          </div>
  
          <div class="stat-item">
            <div class="progress-ring">
              <svg viewBox="0 0 100 100">
                <circle class="progress-ring-bg" cx="50" cy="50" r="45"/>
                <circle class="progress-ring-circle" cx="50" cy="50" r="45" 
                  :style="{ strokeDashoffset: calculateOffset(12.03) }"/>
              </svg>
              <div class="progress-text">
                <span class="value">12.03</span>
                <span class="unit">%</span>
              </div>
            </div>
            <div class="stat-label">实用新型</div>
          </div>
  
          <div class="stat-item">
            <div class="progress-ring">
              <svg viewBox="0 0 100 100">
                <circle class="progress-ring-bg" cx="50" cy="50" r="45"/>
                <circle class="progress-ring-circle" cx="50" cy="50" r="45" 
                  :style="{ strokeDashoffset: calculateOffset(0.75) }"/>
              </svg>
              <div class="progress-text">
                <span class="value">0.75</span>
                <span class="unit">%</span>
              </div>
            </div>
            <div class="stat-label">外观设计</div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'PatentStats',
    methods: {
      calculateOffset(percentage) {
        const circumference = 2 * Math.PI * 45; // 2πr
        return circumference * (1 - percentage / 100);
      }
    }
  }
  </script>
  
  <style scoped>
  .patent-stats-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  /* 通用样式 */
  .patent-stat-section,
  .patent-grant-section {
    background: linear-gradient(180deg, rgba(0,41,107,0.8) 0%, rgba(0,24,62,0.8) 100%);
    border-radius: 4px;
    padding: 1px;
    position: relative;
    overflow: hidden;
    --border-angle: 45deg;
    --border-gradient: linear-gradient(var(--border-angle), 
      rgba(0,157,255,0.1),
      rgba(0,157,255,0.4) 25%,
      rgba(0,157,255,0.8) 50%,
      rgba(0,157,255,0.4) 75%,
      rgba(0,157,255,0.1)
    );
  }
  
  .section-header {
    padding: 10px 20px;
    position: relative;
  }
  
  .title-box {
    color: #fff;
    font-size: 16px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 8px;
    position: relative;
    justify-content: flex-start;
    padding-left: 40px;
    margin-right: auto;
    margin-left: 0;
    width: fit-content;
  }
  
  .title-text {
    position: relative;
    padding: 0 15px;
    background: linear-gradient(90deg, #0066cc, #00ccff);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 0 10px rgba(0,157,255,0.5);
  }
  
  .title-decoration {
    position: absolute;
    width: 40px;
    height: 2px;
    background: var(--border-gradient);
    opacity: 0.8;
  }
  
  .title-decoration.left {
    left: -50px;
    transform: skew(-45deg);
  }
  
  .title-decoration.right {
    right: -50px;
    transform: skew(45deg);
  }
  
  .dot {
    width: 4px;
    height: 4px;
    background: #009DFF;
    border-radius: 50%;
    display: inline-block;
    box-shadow: 0 0 4px #009DFF;
    animation: pulse 2s infinite;
    position: relative;
  }
  
  .dot::after {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    background: inherit;
    border-radius: inherit;
    filter: blur(2px);
    animation: dotGlow 2s infinite;
  }
  
  /* 专利分类统计样式 */
  .stat-cards {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    gap: 20px;
  }
  
  .stat-card {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 8px;
  }
  
  .card-label {
    color: #fff;
    font-size: 14px;
    opacity: 0.8;
    text-align: center;
    text-shadow: 0 0 10px rgba(0,157,255,0.5);
  }
  
  .card-value {
    position: relative;
    perspective: 1000px;
    height: 60px;
  }
  
  .value-box {
    position: relative;
    width: 100%;
    height: 100%;
    transform-style: preserve-3d;
    transform: translateZ(20px) skew(-8deg);
    transition: all 0.3s ease;
    border: 1px solid rgba(0,157,255,0.3);
    background: linear-gradient(135deg, 
      rgba(0,24,62,0.9) 0%,
      rgba(0,41,107,0.9) 100%
    );
  }
  
  .value-border-top,
  .value-border-bottom,
  .value-border-left,
  .value-border-right {
    position: absolute;
    background: var(--border-gradient);
    opacity: 0.8;
    filter: blur(0.5px);
  }
  
  .value-border-top,
  .value-border-bottom {
    height: 2px;
    left: 10px;
    right: 10px;
  }
  
  .value-border-left,
  .value-border-right {
    width: 2px;
    top: 10px;
    bottom: 10px;
  }
  
  .value-border-top {
    top: 0;
    transform: skew(-45deg);
  }
  
  .value-border-bottom {
    bottom: 0;
    transform: skew(45deg);
  }
  
  .value-border-left {
    left: 0;
    transform: skew(0deg, 45deg);
  }
  
  .value-border-right {
    right: 0;
    transform: skew(0deg, -45deg);
  }
  
  .number {
    display: block;
    font-size: 32px;
    font-weight: 500;
    position: relative;
    z-index: 2;
    text-align: center;
    padding: 10px;
    background: linear-gradient(180deg, #FFE55C 0%, #FFA500 100%);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
    animation: numberGlow 2s infinite;
    transform: skew(8deg);
    font-family: 'DIN', 'Arial', sans-serif;
    letter-spacing: 2px;
  }
  
  /* 专利授权数量样式 */
  .total-count {
    text-align: center;
    padding: 20px 0;
    position: relative;
  }
  
  .count-value {
    font-size: 48px;
    font-weight: 500;
    font-family: 'DIN', 'Arial', sans-serif;
    background: linear-gradient(180deg, #FFE55C 0%, #FFA500 100%);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
    position: relative;
    z-index: 2;
  }
  
  .grant-stats {
    display: flex;
    justify-content: space-around;
    padding: 20px;
    gap: 30px;
  }
  
  .stat-item {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
  
  .progress-ring {
    position: relative;
    width: 100px;
    height: 100px;
  }
  
  .progress-ring svg {
    transform: rotate(-90deg);
  }
  
  .progress-ring-bg {
    fill: none;
    stroke: rgba(0, 157, 255, 0.1);
    stroke-width: 4;
  }
  
  .progress-ring-circle {
    fill: none;
    stroke: #00CCFF;
    stroke-width: 4;
    stroke-linecap: round;
    stroke-dasharray: 283;
    transition: stroke-dashoffset 0.5s ease;
    filter: drop-shadow(0 0 4px #00CCFF);
  }
  
  .progress-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #fff;
    font-family: 'DIN', 'Arial', sans-serif;
  }
  
  .progress-text .value {
    font-size: 20px;
    font-weight: 500;
    color: #00CCFF;
    text-shadow: 0 0 10px rgba(0, 204, 255, 0.5);
  }
  
  .progress-text .unit {
    font-size: 12px;
    margin-left: 2px;
    opacity: 0.8;
  }
  
  /* 动画 */
  @keyframes numberGlow {
    0% {
      text-shadow: 0 0 8px rgba(255, 215, 0, 0.3);
    }
    50% {
      text-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
    }
    100% {
      text-shadow: 0 0 8px rgba(255, 215, 0, 0.3);
    }
  }
  
  @keyframes dotGlow {
    0%, 100% {
      transform: scale(1);
      opacity: 0.5;
    }
    50% {
      transform: scale(1.5);
      opacity: 0.8;
    }
  }
  
  @keyframes pulse {
    0% {
      transform: scale(1);
      opacity: 1;
    }
    50% {
      transform: scale(1.2);
      opacity: 0.8;
    }
    100% {
      transform: scale(1);
      opacity: 1;
    }
  }
  
  /* 响应式设计 */
  @media (max-width: 768px) {
    .stat-cards,
    .grant-stats {
      flex-direction: column;
      align-items: center;
    }
  
    .stat-card,
    .stat-item {
      width: 100%;
      max-width: 200px;
    }
  
    .number {
      font-size: 24px;
    }
  
    .count-value {
      font-size: 36px;
    }
  }
  </style> 