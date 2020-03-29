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
            v-model="modelTime"
            :button-now-translation="'目前時間'"
            :format="'YYYY-MM-DD HH:mm'"
            :noClearButton="true"
            :no-value-to-custom-elem="true"
          >
            <button type="button">時間設定</button>
          </VueCtkDateTimePicker>
          <p>{{viewTime}}</p>
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
      modelTime: null,
      viewTime: null
    };
  },
  methods: {
    closeContent: function() {
      this.$store.commit("cardContent/closeContent");
    },
    test: function() {
      console.log(this.cardContent);
    }
  },
  mounted: function() {
    this.$nextTick(function() {
      let buttonNow = document.getElementsByClassName("datepicker-button now");
      let buttonValidate = document.getElementsByClassName(
        "datepicker-button validate"
      );
      let that = this;
      buttonNow[0].addEventListener("click", function() {
        that.$store.dispatch("cardContent/updateCardTime", that.modelTime);
      });
      buttonValidate[0].addEventListener("click", function() {
        that.$store.dispatch("cardContent/updateCardTime", that.modelTime);
      });
    });
  },
  computed: mapState("cardContent", [
    "cardContentView",
    "cardContent",
    "cardId",
    "cardIndex",
    "listIndex"
  ]),
  watch: {
    cardContentView() {
      if (this.cardContentView === true) {
        this.modelTime = this.cardContent.endtime_at
        this.viewTime = this.cardContent.endtime_at
      } else {
        this.modelTime = null;
      }
    },
    'cardContent.endtime_at'() {
      this.viewTime = this.cardContent.endtime_at
    }
  },
  components: {
    VueCtkDateTimePicker
  }
};
</script>