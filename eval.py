"""Approximately simulates trec_eval using pytrec_eval."""

import argparse
import os
import sys

from tqdm import tqdm
import pytrec_eval


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--qrel')
    parser.add_argument('--run')
    parser.add_argument('--save')

    args = parser.parse_args()

    assert os.path.exists(args.qrel)
    assert os.path.exists(args.run)

    with open(args.qrel, 'r') as f_qrel:
        qrel = pytrec_eval.parse_qrel(f_qrel)

    with open(args.run, 'r') as f_run:
        run = pytrec_eval.parse_run(f_run)

    evaluator = pytrec_eval.RelevanceEvaluator(
        qrel, pytrec_eval.supported_measures)

    results = evaluator.evaluate(run)

    def print_line(measure, scope, value):
        print('{:25s}{:8s}{:.4f}'.format(measure, scope, value))

    for query_id, query_measures in tqdm(sorted(results.items())):
        for measure, value in sorted(query_measures.items()):
            # print_line(measure, query_id, value)
            pass

    # Scope hack: use query_measures of last item in previous loop to
    # figure out all unique measure names.
    #
    # TODO(cvangysel): add member to RelevanceEvaluator
    #                  with a list of measure names.

    

    save_data = []
    for measure in sorted(query_measures.keys()):
        res = pytrec_eval.compute_aggregated_measure(
                measure,
                [query_measures[measure]
                 for query_measures in results.values()])
        print_line(
            measure,
            'all',
            res)
        save_data.append(f"{measure}\t{res}\n")
    if args.save:
        with open(args.save, "w") as f:
            f.writelines(save_data)

if __name__ == "__main__":
    sys.exit(main())