<?php


namespace App\Filters;

use Illuminate\Http\Request;


class ApiFilters {
   /**
    * New Version
    */

   protected $safeParms;
   protected $columnMap;
   protected $operatorMap;

   public function __construct()
   {
      $this->safeParms = [];
      $this->columnMap = [];
      $this->operatorMap = [
         'eq' => '=',
         'lt' => '<',
         'lte' => '<=',
         'gt' => '>',
         'gte' => '>=',
         'like' => 'like',
      ];
   }


   public function transform(Request $request) {
      $eloQuery = [];

      foreach($this->safeParms as $parm => $operators) {
         $query = $request->query($parm);

         if(!isset($query)) continue;

         $eloQuery = array_merge($eloQuery, $this->applyFilter($parm, $operators, $query));
      }

      return $eloQuery;
   }

   protected function applyFilter($parm, $operators, $query) {
      $eloQuery = [];

      $column = $this->getColumn($parm);

      foreach($operators as $operator) {
         $value = $this->getValue($query, $operator);

         if(isset($value)) 
            $eloQuery[] = [$column, $this->operatorMap[$operator], $value];
      }

      return $eloQuery;
   }

   protected function getColumn($parm) {
      return $this->columnMap[$parm] ?? $parm;
   }

   protected function getValue($query, $operator) {
      if(!isset($query[$operator])) return null;

      $value = $query[$operator];

      if($operator === 'like') 
         $value = '%' . $value . '%';
      
      return $value;
   }
}