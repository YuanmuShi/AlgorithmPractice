//
//  121-BestTimeToBuyAndSellStock.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/6.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 121. 买卖股票的最佳时机

 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

 示例 1：

 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。

 提示：

 1 <= prices.length <= 105
 0 <= prices[i] <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

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
  static func test121() {
    print(maxProfit([7, 1, 5, 3, 6, 4]))
    print(maxProfit([7, 6, 4, 3, 1]))
  }

  // DP
  private static func maxProfit(_ prices: [Int]) -> Int {
    // DP[i][j]: i 代表第 i 天的最大利润，j 取 0或1，0代表当天不持股，1代表当天持股
    var dp: [[Int]] = []
    dp.append([0, -(prices.first ?? 0)])

    for i in 1 ..< prices.count {
      let preState = dp[i - 1]
      // 当天不持股的最大利润
      // 这里dp[i - 1][1] + prices[i]为什么能保证只卖了一次，因为下面一行代码买的时候已经保证了只买一次，所以这里自然就保证了只卖一次，不管是只允许交易一次还是允许交易多次，这行代码都不用变，因为只要保证只买一次（保证了只卖一次）或者买多次（保证了可以卖多次）即可。
      let maxProfitWithNoStock = max(preState[0], preState[1] + prices[i])
      // 当天持股的最大利润
      //  - prices[i]这里可以理解为dp[0][0] - prices[i]，这里为什么是dp[0][0] - prices[i]，因为只有这样才能保证只买一次，所以需要用一开始初始化的未持股的现金dp[0][0]减去当天的股价
      let maxProfitWithStock = max(dp[0][0] - prices[i], preState[1])

      // 如果题目允许交易多次，就说明可以从直接从昨天的未持股状态变为今天的持股状态，因为昨天未持股状态可以代表之前买过又卖过后的状态，也就是之前交易过多次后的状态。也就是下面的代码。
//      let maxProfitWithStock = max(preState[0] - prices[i], preState[1])
      
      dp.append([maxProfitWithNoStock, maxProfitWithStock])
    }

    return dp.last?.first ?? 0
  }

  // 单次遍历，只适用于当前题目
  private static func maxProfit1(_ prices: [Int]) -> Int {
    var minPrice = prices.first ?? 0
    var maxProfit = 0

    prices.forEach { price in
      minPrice = min(minPrice, price)
      maxProfit = max(maxProfit, price - minPrice)
    }
    return maxProfit
  }
}
