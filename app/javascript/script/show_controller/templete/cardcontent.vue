<template>
  <div
    v-show="cardContentView"
    @click="closeContent"
    class="windows-card-content w-full h-full left-0 top-0 bg-gray-op fixed flex justify-center items-center"
  >
    <div @click="test" @click.stop class="w-78p h-4/5 bg-red-100 bg-black rounded">
      <div class="w-full h-full">
        <div class="windows-header">頭</div>
        <div class="windows-content float-left">中</div>
        <div class="windows-sider float-right">
          <VueCtkDateTimePicker
            v-model="time"
            :noClearButton="true"
            :no-value-to-custom-elem="true"
          >
            <button type="button">時間設定</button>
          </VueCtkDateTimePicker>
          <p>{{time}}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import VueCtkDateTimePicker from "vue-ctk-date-time-picker";
import "vue-ctk-date-time-picker/dist/vue-ctk-date-time-picker.css";
import { mapState } from "vuex";

export default {
  data: function() {
    return {
      time: null
    };
  },
  methods: {
    closeContent: function() {
      this.$store.commit("cardContent/closeContent");
    },
    test: function() {
      console.log(this.$store.state.cardContent.cardContent.endtime_at);
      console.log(this.cardContent);
      console.log(this.time);
    }
  },
  computed: mapState("cardContent", ["cardContentView", "cardContent"]),
  watch: {
    cardContentView() {
      this.time = this.$store.state.cardContent.cardContent.endtime_at;
    }
  },
  components: {
    VueCtkDateTimePicker
  }
};
</script>