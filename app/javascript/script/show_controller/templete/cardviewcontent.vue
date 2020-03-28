<template>
  <div
    @click="showCardContent"
    :id="'card-item-' + cardIndex"
    class="card-item block h-32 w-full cursor-pointer border-dashed border-2"
  >
    <span>{{cardContent.title}}</span>
    <div>
      <i class="far fa-clock"></i>
      <span>{{timeFormat}}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: ["cardContent", "cardIndex", "listItem"],
  methods: {
    showCardContent: function() {
      this.$store.dispatch("cardContent/getCardContent", {
        cardId: this.cardContent.id,
        listId: this.listItem.id
      });
    }
  },
  computed: {
    timeFormat: function(){
      return this.cardContent.endtime_at
    }
  }
};
</script>