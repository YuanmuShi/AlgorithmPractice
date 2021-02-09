//
//  122-BestTimeToBuyAndSellStockII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/9.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 这一系列问题的目录：

 题号  题解
 121. 买卖股票的最佳时机  暴力解法、动态规划（Java）
 122. 买卖股票的最佳时机 II  暴力搜索、贪心算法、动态规划（Java）
 123. 买卖股票的最佳时机 III  动态规划（Java）
 188. 买卖股票的最佳时机 IV  动态规划（「力扣」更新过用例，只有优化空间的版本可以 AC）
 309. 最佳买卖股票时机含冷冻期  动态规划（Java）
 714. 买卖股票的最佳时机含手续费  动态规划（Java）

 作者：liweiwei1419
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/solution/bao-li-mei-ju-dong-tai-gui-hua-chai-fen-si-xiang-b/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

extension Solution {
  private func maxProfit(_ prices: [Int]) -> Int {
    // DP[i][j]: i 代表第 i 天的最大利润，j 取 0或1， 0代表当天不持股，1代表当天持股
    var dp: [[Int]] = []
    dp.append([0, -(prices.first ?? 0)])

    for i in 1 ..< prices.count {
      let preState = dp[i - 1]
      // 当天不持股的最大利润
      let maxProfitWithNoStock = max(preState[0], preState[1] + prices[i])
      // 当天持股的最大利润
      let maxProfitWithStock = max(preState[0] - prices[i], preState[1])

      dp.append([maxProfitWithNoStock, maxProfitWithStock])
    }

    return dp.last?.first ?? 0
  }
}
