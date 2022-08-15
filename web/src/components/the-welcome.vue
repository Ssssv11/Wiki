<template>
  <div>
    <div class="tip">
      <div>
        <b>SpringBoot + Vue3</b>
      </div>
      <br>
      <div>
        <b>源码地址</b>：
        <a href="https://github.com/Ssssv11/Wiki" target="_blank">
          WIKI 项目地址
        </a>
      </div>
      <br>
      <div>
        <span>待解决问题：</span>
        <ul>
          <li>集成 Echarts</li>
          <li>下列数据统计优化</li>
          <li>登录与退出 Menu 位置优化</li>
          <li>添加Wiki内容</li>
        </ul>
      </div>
    </div>

    <a-row>
      <a-col :span="24">
        <a-card>
          <a-row>
            <a-col :span="8">
              <a-statistic title="总阅读量" :value="statistic.viewCount">
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8">
              <a-statistic title="总点赞量" :value="statistic.voteCount">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8">
              <a-statistic title="点赞率" :value="statistic.voteCount / statistic.viewCount * 100"
                           :precision="2"
                           suffix="%"
                           :value-style="{ color: '#cf1322' }">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
    <br>
    <a-row :gutter="16">
      <a-col :span="12">
        <a-card>
          <a-row>
            <a-col :span="12">
              <a-statistic title="今日阅读" :value="statistic.todayViewCount" style="margin-right: 50px">
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="12">
              <a-statistic title="今日点赞" :value="statistic.todayVoteCount">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
      <a-col :span="12">
        <a-card>
          <a-row>
            <a-col :span="12">
              <a-statistic
                title="预计今日阅读"
                :value="statistic.todayViewIncrease"
                :value-style="{ color: '#0000ff' }"
              >
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="12">
              <a-statistic
                title="预计今日阅读增长"
                :value="statistic.todayViewIncreaseRateAbs"
                :precision="2"
                suffix="%"
                class="demo-class"
                :value-style="statistic.todayViewIncreaseRate < 0 ? { color: '#3f8600' } : { color: '#cf1322' }"
              >
                <template #prefix>
                  <arrow-down-outlined v-if="statistic.todayViewIncreaseRate < 0"/>
                  <arrow-up-outlined v-if="statistic.todayViewIncreaseRate >= 0"/>
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
    <br>
    <a-row>
      <a-col :span="16" id="main-col">
        <div id="main" style="width: 100%;height:300px;"></div>
      </a-col>
    </a-row>
  </div>
</template>

<script lang="ts">
import {defineComponent, onMounted, ref} from 'vue'
import axios from 'axios';

export default defineComponent({
    name: 'the-welcome',
    setup () {
      const statistic = ref();
      statistic.value = {};
      const getStatistic = () => {
        axios.get('/ebook-snapshot/get-statistic').then((response) => {
          const data = response.data;
          if (data.success) {
            const statisticResp = data.content;
            statistic.value.viewCount = statisticResp[1].viewCount;
            statistic.value.voteCount = statisticResp[1].voteCount;
            statistic.value.todayViewCount = statisticResp[1].viewIncrease;
            statistic.value.todayVoteCount = statisticResp[1].voteIncrease;
            const now = new Date();
            const nowRate = (now.getHours() * 60 + now.getMinutes()) / (60 * 24);
            statistic.value.todayViewIncrease = parseInt(String(statisticResp[1].viewIncrease / nowRate));
            statistic.value.todayViewIncreaseRate = (statistic.value.todayViewIncrease - statisticResp[0].viewIncrease) / statisticResp[0].viewIncrease * 100;
            statistic.value.todayViewIncreaseRateAbs = Math.abs(statistic.value.todayViewIncreaseRate);
          }
        });
      };

      onMounted(() => {
        getStatistic();
      });

      return {
        statistic
      }
    }
  });
</script>
<style scoped>
  .tip {
    padding: 10px 5px;
    margin-bottom: 20px;
    color: #ee5252;
    border: 1px solid transparent;
    background: linear-gradient(white,white) padding-box,repeating-linear-gradient(-45deg, black 0, black 25%, white 0, white 50%) 0/.6em .6em;
    animation:ants 12s linear infinite;
  }
</style>
